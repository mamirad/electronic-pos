class WebsitesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'website'
  def index
    options={}
    options[:conditions]={}
    options[:raw_query]=[]
    session[:brand]=""
    if params[:brand].present?
      brand = Base64.decode64(params[:brand])
      session[:brand]=brand
    end
    if params[:store].present?
      store = Base64.decode64(params[:store])
      session[:store]=store
    end
    if store.blank?
      store="0"
      session[:store]="0"
    end
    if store.present?
      session[:store]=store
    end
    options[:raw_query] <<  "lower(brand) = '#{brand}'" if brand.present?
    options[:raw_query] <<  "store_configuration_id = '#{store}'" 
    options[:raw_query] = options[:raw_query].join(" and ")
    @items = Item.where("stock_amount>? and is_online=?",0,true).where(options[:raw_query]).order('items.item_category_id,items.brand')
  end

  def single_item
    if params[:brand].present?
      brand = Base64.decode64(params[:brand])
      session[:brand]=brand
    end
    if params[:store].present?
      store = Base64.decode64(params[:store])
      session[:store]=store
    end
    if store.blank?
      store="0"
      session[:store]="0"
    end
    if store.present?
      session[:store]=store
    end
    options={}
    options[:conditions]={}
    options[:raw_query]=[]
    options[:raw_query] <<  "lower(brand) = '#{session[:brand]}'" if session[:brand].present?
    options[:raw_query] = options[:raw_query].join(" and ")

    options[:conditions].deep_merge!({id:params[:item_id]}) if params[:item_id].present?
    options[:conditions].deep_merge!({store_configuration_id:session[:store]}) if session[:store].present?

    @item = Item.where(options[:conditions]).where(options[:raw_query])&.last



  end

  def add_to_cart
    session[:cart] ||={}
    session[:cart][params[:item_id]] ||=0
    session[:cart][params[:item_id]] +=params[:quantity].to_i
    flash[:success]="Item added successfully"
    redirect_to discount_path(store:Base64.encode64(session[:store]),brand:Base64.encode64(session[:brand]))
  end

  def buy_now
    session[:cart] ||={}
    session[:cart][params[:item_id]] ||=0
    session[:cart][params[:item_id]] +=params[:quantity].to_i
    flash[:success]="Item added successfully"
    redirect_to list_cart_path

  end

  def list_cart
    options={}
    options[:conditions]={}
    options[:raw_query]=[]
    options[:raw_query] <<  "lower(brand) = '#{session[:brand]}'" if session[:brand].present?
    options[:raw_query] = options[:raw_query].join(" and ")

    options[:conditions].deep_merge!({id:session[:cart]&.keys}) if session[:cart]&.keys.present?
    options[:conditions].deep_merge!({store_configuration_id:session[:store]}) if session[:store].present?
    @items = Item.where(options[:conditions]).where(options[:raw_query]) if session[:cart]&.keys.present?

    @cart_amount =@items.inject(0){|e,item|e+(item.discount_price*session[:cart][item.id.to_s])} if session[:cart]&.keys.present?

  end

  def destroy_cart_item
    session[:cart].delete(params[:item_id].to_s) if params[:item_id].present?
    redirect_to list_cart_path
  end

  def popup_checkout
   respond_to do |format|
    format.js{}
    format.html{}
   end
  end

  def change_cart_qty
    session[:cart][params[:item_id]] ||=0
    session[:cart][params[:item_id]]=params[:quantity].to_i
    

    # @items = Item.find(session[:cart].keys)
    # @cart_amount = @items.inject(0){|e,item|e+(item.discount*session[:cart][item.id.to_s])} if @items.present?
    respond_to do |format|
      format.js{}
    end
  end

  def save_order
    begin
      ActiveRecord::Base.transaction do
        options={}
        options[:conditions]={}
        options[:raw_query]=[]
        options[:raw_query] <<  "lower(brand) = '#{session[:brand]}'" if session[:brand].present?
        options[:raw_query] = options[:raw_query].join(" and ")

        options[:conditions].deep_merge!({id:session[:cart]&.keys}) if session[:cart]&.keys.present?
        options[:conditions].deep_merge!({store_configuration_id:session[:store]}) if session[:store].present?

        @items = Item.where(options[:conditions]).where(options[:raw_query])
    
        @cart_amount = @items.inject(0){|e,item|e+(item.discount_price*session[:cart][item.id.to_s])} if @items.present?
        @customer = Customer.where(phone_number:params[:mobile])
        if @customer.present?
          @customer = @customer.last
        else
          @customer = Customer.create!(first_name:params[:name],phone_number:params[:mobile],address:params[:address])
        end
        @sale = Sale.create!(customer_id:@customer.id,sale_type:'online',total_amount:@cart_amount,remaining_amount:@cart_amount,sale_status:'in_progress',store_configuration_id:session[:store])
        @items.each do |item|
          total_price = session[:cart][item.id.to_s].to_i*item.discount_price
          profit = (item.discount_price.to_i - item.cost_price.to_i)*session[:cart][item.id.to_s].to_i
          @sale.line_items.create!(item_id:item.id,quantity:session[:cart][item.id.to_s],price:item.discount_price,total_price:total_price,profit:profit)
          stock_amount = item.stock_amount-session[:cart][item.id.to_s]
          amount_sold = item.amount_sold+session[:cart][item.id.to_s]
          item.update!(stock_amount:stock_amount,amount_sold:amount_sold)
        end
        # MyMailer.receive_online_order(@sale,@customer).deliver_now
        flash[:success] = "Your Order has  been placed"
        session[:cart]={}
        session[:order_status] = "onway"
        redirect_to list_cart_path
      end
    rescue Exception => e
      ActiveRecord::Rollback
      Rails.logger.info "Error"+e.message
      flash[:error]="Error"+e.message
      redirect_to list_cart_path
    end
  end
end
