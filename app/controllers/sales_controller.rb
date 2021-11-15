class SalesController < ApplicationController
  before_action :set_configurations
  before_action :get_stock_in_hand, only: [:create_line_item, :add_item]
  skip_before_action :authenticate_user!,only: [:make_receipt]


  def index
    options={}
    options[:conditions]={}
    options[:raw_query]=[]
    options[:conditions].deep_merge!(id:params[:sale_id]) if params[:sale_id].present?
    options[:conditions].deep_merge!(customer_id:params[:customer_id]) if params[:customer_id].present? 
    options[:raw_query].push(params[:start_date].present? ? "sales.created_at >= '#{params[:start_date]}'" : "sales.created_at >= '#{Time.now.at_beginning_of_month}'")  unless params[:skip_start_date].present?
    options[:raw_query] <<  "sales.created_at <= '#{params[:end_date]}'" if params[:end_date].present?
    options[:raw_query] <<  "sales.remaining_amount > '0'" if params[:own_sale].present?

    options[:raw_query] = options[:raw_query].join(" and ")
    @sales = Sale.where("sales.total_amount > ?",0).where(options[:conditions]).where(options[:raw_query]).includes(:items).paginate(page: params[:page], per_page: 10).order('sales.created_at DESC')
    @total_sale_amount = @sales.pluck(:total_amount).inject(&:+).to_i if @sales.present?
    @current_sales = Sale.where(id:@sales.pluck(:id))
    @sale_remaining_amount = @current_sales.sum(:remaining_amount)
    @total_paid_amount = @current_sales.joins(:payments).sum("payments.amount").to_i
    @filer_reset = (params[:sale_id].present? || params[:customer].present? ||  params[:start_date].present? ||  params[:end_date].present?) ?  true : false
  end

  def online
    options={}
    options[:conditions]={}
    options[:raw_query]=[]
    options[:conditions].deep_merge!(id:params[:sale_id]) if params[:sale_id].present?
    options[:conditions].deep_merge!(customer_id:params[:customer]) if params[:customer].present? 
    options[:raw_query].push(params[:start_date].present? ? "sales.created_at >= '#{params[:start_date]}'" : "sales.created_at >= '#{Time.now.at_beginning_of_month}'")
    options[:raw_query] <<  "sales.created_at <= '#{params[:end_date]}'" if params[:end_date].present?
    options[:raw_query] = options[:raw_query].join(" and ")
    @sales = Sale.online.where("sales.total_amount > ?",0).where(options[:conditions]).where(options[:raw_query]).includes(:items).paginate(page: params[:page], per_page: 10).order('sales.created_at DESC')
    @total_sale_amount = @sales.pluck(:total_amount).inject(&:+).to_i if @sales.present?
    @current_sales = Sale.where(id:@sales.pluck(:id))
    @sale_remaining_amount = @current_sales.sum(:remaining_amount)
    @total_paid_amount = @current_sales.joins(:payments).sum("payments.amount").to_i
    @filer_reset = (params[:sale_id].present? || params[:customer].present? ||  params[:start_date].present? ||  params[:end_date].present?) ?  true : false
  end

  def change_status
    set_sale
    if params[:status]=='completed'
      unless @sale.sale_status=='in_progress'
        @sale.line_items.includes(:item).each do|line_item|
          @item = line_item.item
          @item.stock_amount = @item.stock_amount.to_i-line_item.quantity.to_i
          @item.amount_sold = @item.amount_sold.to_i+line_item.quantity.to_i
          @item.save!
        end
      end
    else
      @sale.line_items.includes(:item).each do|line_item|
        @item = line_item.item
        @item.stock_amount = @item.stock_amount.to_i+line_item.quantity.to_i
        @item.amount_sold = @item.amount_sold.to_i-line_item.quantity.to_i
        @item.save!
      end      
    end
    @sale.send("#{params[:status]}!")
    session[:order_status] = params[:status]=='completed' ?  "" : 'onway'
    redirect_to online_sales_path
  end

  def make_receipt
    @sale = Sale.find(Base64.decode64(params[:id]))
    @line_items = @sale.line_items.includes(:item)
    @payments = @sale.payments
    respond_to do |format|
      format.pdf{
        render pdf: "Invoice##{@sale.id}"
      }
      format.html{}
    end

  end

  def new
    @sale = Sale.create(store_configuration_id:@configurations.id,sale_type:Sale.sale_types[params[:sale_type]])
    session[:sale_id] = @sale.id
    # @line_items = @sale.line_items
    # @payments = @sale.payments
    # respond_to do |format|
    #   format.html{}
    # end
    redirect_to edit_sale_path(@sale.id)
  end



  def edit
    set_sale
    session[:sale_id] = @sale.id
    @customer = @sale.customer
    @line_items = @sale.line_items.includes(:item)
    @payments = @sale.payments
  end

  
  def get_sale_obj
    set_sale
    render json:@sale
  end



  def destroy
    begin
      @url =  params[:sale_type]=='online' ? 'online_sales_path':'sales_path'
      set_sale
      if current_user.can_update_items == true
        @sale.line_items.includes(:item).each do|line_item|
          @item = line_item.item
          @item.stock_amount = @item.stock_amount.to_i+line_item.quantity.to_i
          @item.amount_sold = @item.amount_sold.to_i-line_item.quantity.to_i
          @item.save!
        end
        @sale.destroy!
      else
        redirect_to @sale, notice: 'You do not have permission to delete sales.'
      end
      
      respond_to do |format|
        format.html { redirect_to send(@url), notice: 'Sale has been deleted.' }
      end
    rescue Exception => e
      redirect_to send(@url), notice: "Error: #{e.message}"
    end
    
  end

  # searched Items
  def update_line_item_options
    set_sale
    populate_items
    options={}
    options.deep_merge!(published:true)
    options.deep_merge!(item_category_id:params[:search][:item_category]) if params[:search][:item_category].present?
    options.deep_merge!("raw_query":"name ILIKE '%#{params[:search][:item_name]}%'") if params[:search][:item_name].present?
    
    @available_items = Item.where(options).where(options[:raw_query]).limit(5)
    # if params[:search][:item_category].blank?
    #   @available_items = Item.all.where('name ILIKE ? AND published = true OR description ILIKE ? AND published = true OR sku ILIKE ? AND published = true', "%#{params[:search][:item_name]}%", "%#{params[:search][:item_name]}%", "%#{params[:search][:item_name]}%").limit(5)
    # elsif params[:search][:item_name].blank?
    #   @available_items = Item.where(item_category_id: params[:search][:item_category]).limit(5)
    # else
    #   @available_items = Item.all.where(
    #     'name ILIKE ? 
    #     AND published = true 
    #     AND item_category_id = ? 
    #     OR description ILIKE ? 
    #     AND published = true 
    #     AND item_category_id = ? 
    #     OR sku ILIKE ? 
    #     AND published = true
    #      AND item_category_id = ?', "%#{params[:search][:item_name]}%", "#{params[:search][:item_category]}", "%#{params[:search][:item_name]}%", "#{params[:search][:item_category]}", "%#{params[:search][:item_name]}%", "#{params[:search][:item_category]}").limit(5)
   

    # end
    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  def update_customer_options
    set_sale
    populate_items
    @available_customers = Customer.all.where('last_name ILIKE ? AND published = true OR first_name ILIKE ? AND published = true OR email_address ILIKE ? AND published = true OR phone_number ILIKE ? AND published = true', "%#{params[:search][:customer_name]}%", "%#{params[:search][:customer_name]}%", "%#{params[:search][:customer_name]}%", "%#{params[:search][:customer_name]}%").limit(5)

    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  def create_customer_association
    begin
      ActiveRecord::Base.transaction do
        @sale = Sale.find(session[:sale_id])
        unless @sale.blank? || params[:customer_id].blank?
          @customer = Customer.find(params[:customer_id])
          @sale.customer_id = params[:customer_id]
          @sale.save
        end
      end
    rescue Exception => e
      ActiveRecord::Rollback
      Rails.logger.info "Error while adding customer"
      Rails.logger.info e.message
    end
    

    respond_to do |format|
      format.js{}
    end
  end

  # Add a searched Item
  def create_line_item
    begin
      ActiveRecord::Base.transaction do
        @item_id = params[:item_id]
        @item = Item.where("id=? or sku=?",@item_id.to_i,@item_id.to_s)&.first
        # @item = Item.find(@item_id)
        @sale = Sale.find(session[:sale_id])
        @sale_item = @sale.line_items.where(item_id:@item.id) if @item.present?
        if @sale_item.blank?
          if @item.present?
            profit = (@item.price-@item.cost_price)
            @line_item = @sale.line_items.create!(item_id:@item.id,quantity:1,price:@item.price,total_price:@item.price,profit:profit) 
            @sale.total_amount = @sale.total_amount.to_i + @item.price.to_i
            @sale.remaining_amount = @sale.remaining_amount.to_i + @item.price.to_i
            @item.stock_amount = @item.stock_amount - 1
            @item.amount_sold = @item.amount_sold + 1
            @sale.save!
            @item.save!
            flash.now[:success]='Item added'
          else
            flash.now[:error]='No Item Found'
          end
        end
      end  
    rescue Exception => e
      ActiveRecord::Rollback
      flash.now[:error] = "Error:#{e.message}"
      @errors = true
    end

    # set_sale
    # populate_items
    # existing_line_item = LineItem.where('item_id = ? AND sale_id = ?', params[:item_id], @sale.id).first
    # if existing_line_item.blank?
      # if @stock_in_hand.to_i>1
        # line_item = LineItem.new(item_id: params[:item_id], sale_id: params[:sale_id], quantity: params[:quantity])
        # line_item.price = line_item.item.price
        # line_item.save


        # remove_item_from_stock(params[:item_id], 1)
        # update_line_item_totals(line_item)
        # flash.now[:success]="Item added now "
      # else
      #   flash.now[:error]= 'Item is out of stock'  
      # end  
    # else
      # if @stock_in_hand>1
        # existing_line_item.quantity += 1
        # existing_line_item.save

        # remove_item_from_stock(params[:item_id], 1)
        # update_line_item_totals(existing_line_item)
      # else
      #    flash.now[:error] = 'Item is out of stock'
      # end     
    # end

    # update_totals

    respond_to do |format|
      format.js{}
      # format.js { ajax_refresh }
    end
  end

  # Remove Item
  def remove_item
    begin
      ActiveRecord::Base.transaction do
        set_sale

        @line_item = LineItem.find(params[:line_item_id])
        return_item_to_stock(@line_item.item_id, @line_item.quantity)
        @sale.remaining_amount = @sale.remaining_amount.to_i-@line_item.total_price
        @line_item.destroy
        @sale.total_amount = @sale.line_items.pluck(:price,:quantity).map{|pq|pq[0]*pq[1]}.inject(&:+)
        @sale.save!
        flash.now[:success] = "Item Destroyed"
      end
    rescue Exception=>error
      ActiveRecord::Rollback
      flash.now[:error]="Error:#{error.message}"
    end
    

    # update_totals
    flash.now[:notice]="Item removed"
    respond_to do |format|
      format.js {}
    end
  end

  def remove_all_items
    set_sale
    populate_items
    line_item = LineItem.where(sale_id: params[:id], item_id: params[:item_id]).first
    return_item_to_stock(params[:item_id], line_item.quantity.to_i)
    line_item.destroy
    update_totals
    flash.now[:notice]="Item(s) removed successfully "
    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  # Add one Item
  def add_item
    set_sale
    populate_items

    if @stock_in_hand>1
      line_item = LineItem.where(sale_id: params[:sale_id], item_id: params[:item_id]).first
      
      line_item.quantity += 1 
      line_item.save


      remove_item_from_stock(params[:item_id], 1)
      update_line_item_totals(line_item)

      update_totals
      flash.now[:success]="Item added now "
     
    else
      flash.now[:error]= "Item is out of stock"
    end  
    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  def create_custom_item
    # @item = Item.create()
    # set_sale
    # populate_items

    # custom_item = Item.new
    # custom_item.sku = "CI#{(rand(5..30) + rand(5..30)) * 11}_#{(rand(5..30) + rand(5..30)) * 11}"
    # custom_item.name = params[:custom_item][:name]
    # custom_item.description = params[:custom_item][:description]
    # custom_item.price = params[:custom_item][:price]
    # custom_item.stock_amount = params[:custom_item][:stock_amount]
    # custom_item.item_category_id = params[:custom_item][:item_category_id]

    # custom_item.save

    # custom_line_item = LineItem.new(item_id: custom_item.id,
    #                                 sale_id: @sale.id,
    #                                 quantity: custom_item.stock_amount,
    #                                 price: custom_item.price)
    # custom_line_item.total_price = custom_item.price * custom_item.stock_amount
    # custom_line_item.save

    # update_totals

    # respond_to do |format|
    #   format.js { ajax_refresh }
    # end
  end

  def create_custom_customer
    set_sale
    populate_items

    custom_customer = Customer.new
    custom_customer.first_name = params[:custom_customer][:first_name]
    custom_customer.last_name = params[:custom_customer][:last_name]
    custom_customer.email_address = params[:custom_customer][:email_address]
    custom_customer.phone_number = params[:custom_customer][:phone_number]
    custom_customer.address = params[:custom_customer][:address]
    custom_customer.city = params[:custom_customer][:city]
    custom_customer.state = params[:custom_customer][:state]
    custom_customer.zip = params[:custom_customer][:zip]

    if custom_customer.save
      @sale.add_customer(custom_customer.id)
      update_totals
      flash[:success] = "Customer has been created successfully"

    end



    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  # update Total For Line Items
  def update_line_item_totals(line_item)
    line_item.total_price = line_item.price * line_item.quantity
    line_item.save
  end

  def override_price
    begin
      ActiveRecord::Base.transaction do
        @sale = Sale.find(params[:override_price][:sale_id])
        item = Item.where(id: params[:override_price][:item_id]).first
        line_item = LineItem.where(sale_id: params[:override_price][:sale_id], item_id: item.id).first
        line_item.price = params[:override_price][:price]
        line_item.profit = (params[:override_price][:price].to_i - item.cost_price.to_i)*line_item.quantity.to_i
        line_item.save!

        update_line_item_totals(line_item)
        @sale.total_amount = @sale.line_items.pluck(:price,:quantity).map{|pq|pq[0]*pq[1]}.inject(&:+)
        @sale.remaining_amount = @sale.total_amount.to_i - (@sale.payments.pluck(:amount).inject(&:+).to_i)
        @sale.save!
        flash.now[:success] = "Price has been changed"
      end
    rescue Exception => error
      ActiveRecord::Rollback
      flash.now[:error] = "Error:#{error.message}"
    end  
    # update_totals

    respond_to do |format|
      format.js {}
    end
  end

  def override_quantity
    begin
      ActiveRecord::Base.transaction do
        @sale = Sale.find(params[:override_quantity][:sale_id])
        item = Item.where(id: params[:override_quantity][:item_id]).first
        line_item = LineItem.where(sale_id: params[:override_quantity][:sale_id], item_id: item.id).first
        old_qty = line_item.quantity.to_i
        new_qty = params[:override_quantity][:quantity].to_i
        diff = new_qty - old_qty
        item.stock_amount = item.stock_amount-(diff)
        item.amount_sold = item.amount_sold + (diff)
        line_item.quantity = params[:override_quantity][:quantity].to_i
        line_item.profit = (line_item.price.to_i - item.cost_price.to_i)*params[:override_quantity][:quantity].to_i
        line_item.save!
        item.save!

        update_line_item_totals(line_item)
        @sale.total_amount = @sale.line_items.pluck(:price,:quantity).map{|pq|pq[0]*pq[1]}.inject(&:+)
        @sale.remaining_amount = @sale.total_amount.to_i - (@sale.payments.pluck(:amount).inject(&:+).to_i)
        @sale.save!
        flash.now[:success] = "Qty changed"
      end
    rescue => error
      ActiveRecord::Rollback
      flash.now[:error] = "Error:#{error.message}"
    end
    

    # update_totals

    respond_to do |format|
      format.js {}
    end
  end

  def sale_discount
    @sale = Sale.find(params[:sale_discount][:sale_id])

    @sale.discount = params[:sale_discount][:discount]
    @sale.save

    update_totals

    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  def destroy_line_item
    set_sale
    update_totals

    respond_to do |format|
      format.js { ajax_refresh }
    end
  end

  def update_totals
    tax_amount = get_tax_rate

    set_sale

    @sale.amount = 0.00

    for line_item in @sale.line_items
      @sale.amount += line_item.total_price
    end

    @sale.tax = @sale.amount * tax_amount
    total_amount = @sale.amount + (@sale.amount * tax_amount)

    if @sale.discount.blank?
      @sale.total_amount = total_amount
    else
      discount_amount = total_amount * @sale.discount
      @sale.total_amount = total_amount - discount_amount
    end

    @sale.save
  end

  def add_comment
    set_sale
    @sale.comments = params[:sale_comments][:comments]
    @sale.save

    respond_to do |format|
      format.js { ajax_refresh }
    end
  end
  def update_account_no
    set_sale
    @sale.account_no = params[:account_no]
    @sale.save
    flash[:success]="Account Number has been set successfully"
  end

  private

  def ajax_refresh
    render(file: 'sales/ajax_reload.js.erb')
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    if @sale.blank?
      if params[:sale_id].blank?
        if params[:search].blank?
          @sale = Sale.find(params[:id])
        else
          @sale = Sale.find(params[:search][:sale_id])
        end
      else
        @sale = Sale.find(params[:sale_id])
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sale_params
    params.require(:sale).permit(:amount,
                                 :tax,
                                 :discount,
                                 :total_amount,
                                 :tax_paid,
                                 :amount_paid,
                                 :paid,
                                 :payment_type_id,
                                 :customer_id,
                                 :comments,
                                 :line_items_attributes,
                                 :items_attributes)
  end

  def populate_items
    # @available_items = Item.all.where(published: true).limit(5)
    @available_items = Item.all.order('amount_sold DESC').limit(5)
  end

  def populate_customers
    @available_customers = Customer.all.where(published: true).limit(5)
  end

  def remove_item_from_stock(item_id, quantity)
    item = Item.find(item_id)
    item.stock_amount = item.stock_amount - quantity
    item.amount_sold += quantity
    item.save
  end

  def return_item_to_stock(item_id, quantity)
    item = Item.find(item_id)
    item.stock_amount = item.stock_amount + quantity
    item.amount_sold = item.amount_sold - quantity
    item.save
  end

  def get_tax_rate
    if @configurations.tax_rate.blank?
      return 0.00
    else
      return @configurations.tax_rate.to_f * 0.01
    end
  end
  def get_stock_in_hand
    @stock_in_hand = Item.where("id=? or sku=?",params[:item_id].to_i,params[:item_id].to_s)&.first&.stock_amount
  end
end
