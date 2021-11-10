class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
   skip_before_action :verify_authenticity_token
  def auto_search
     search_item = {name_cont: params[:q],id_eq: params[:q],brand_cont:params[:q],m:'or'}
    @items = Item.ransack(search_item).result(distinct: true)


    respond_to do |format|
      format.html{}
      format.json{
      } 
    end
  end
  def index
    options={}
    options[:conditions]={}
    options[:raw_query]=[]
    options[:raw_query] <<  "name ILIKE '%#{params[:item_name]}%'" if params[:item_name].present?
    options[:raw_query] <<  "brand ILIKE '%#{params[:brand]}%'" if params[:brand].present?
    item_ids = Item.joins(:item_category).where("item_categories.id=?",params[:item_category] )if params[:item_category].present?
    options[:conditions].deep_merge!(id:item_ids.pluck(:id)) if item_ids.present? 
    options[:raw_query] << "expire_at < '#{Time.now}'" if params[:is_expired]
    options[:raw_query] = options[:raw_query].join(" and ")

    @items = Item.where(options[:conditions]).where(options[:raw_query]).order('items.item_category_id,items.brand')
    # .paginate(page: params[:page], per_page: 20).where(published: true)
    @total_purchase_price = @items.inject(0){|e,item|e+(item.total_quantity*item.cost_price)}
    @stock_in_hand_price = @items.inject(0){|e,item| e+(item.stock_amount*item.cost_price)}
    @filer_reset = (params[:item_categoy].present? || params[:item_name].present? || params[:brand]) ?  true : false
    respond_to do |format|
      format.pdf{
        render pdf: "Items_Detail"
      }
      format.html{}
    end
  end

  def new
    @item = Item.new
    respond_to do |format|
      format.js{}
      format.html{}
    end
  end

  def show
  end

  def edit
    respond_to do |format|
      format.js{}
    end
  end

  def create
    @item = Item.new(item_params)
    @item.store_configuration_id = @configurations.id
    @item.published = params[:item][:published]=="1" ? true : false
    @item.is_online = params[:item][:is_online]=="1" ? true : false

    if @item.save
    ItemStock.create(item_id:@item.id,quantity:params[:item][:stock_amount],old_quantity:0)
      flash[:notice] = 'Item was successfully created.'
      respond_to do |format|
        format.html{
          redirect_to items_path
        }
        format.js{}
      end
    else
       @errors = @item.errors
      respond_to do |format|
        format.html{
          render action: 'new'
        }
        format.js{
          flash.now[:notice] = @errors.to_a
        }
      end
    end
  end

  def update
    params[:item].delete(:stock_amount)
    if @item.update(item_params)
      respond_to do |format|
        format.html{
          flash[:notice] = 'Item was successfully updated.'
          redirect_to items_path
        }
        format.js{flash.now[:notice] = 'Item was successfully updated.'}
      end
    else
       respond_to do |format|
        format.html{
          render action: 'edit'
        }
        format.js{flash.now[:notice] = @item.errors.to_a}
      end
    end
  end

  def destroy
    begin
      @item.destroy
      flash[:success] = "Item has been Deleted"
      redirect_to request.referrer
    rescue Exception => e
      flash[:error] = e.message
      redirect_to request.referrer
    end
  end

  def finish_record
    @items_list = Item.all.order(:name).map{|item|[item.id.to_s+'#'+item.name+'('+item.brand+')',item.id]}
    options={}
    options[:conditions]={}
    options[:raw_query]=[]
    options[:raw_query] <<  "sales.customer_id='#{params[:customer_id]}'" if params[:customer_id].present?
    options[:raw_query] <<  "line_items.item_id = '#{params[:item_id]}'" if params[:item_id].present?
    options[:raw_query] << "sales.created_at >= '#{params[:start_date].present? ? params[:start_date]:Time.now.at_beginning_of_month}'" 
    options[:raw_query] << "sales.created_at <= '#{params[:end_date]}'" if params[:end_date].present?
    options[:raw_query] = options[:raw_query].join(" and ")
    @finish_record =  Sale.completed.joins(:line_items).where(options[:raw_query]).order('line_items.created_at DESC,sales.customer_id,line_items.item_id').group('sales.customer_id','line_items.item_id','line_items.created_at','sales.id').sum("line_items.quantity")
    @filer_reset = (params[:customers].present? || params[:item_id].present? || params[:start_date] || params[:end_date]) ?  true : false
  end

  def pick_file
    @pick_file = XlsxUploader.new
  end
  
  def import    
    begin
      file = params[:file]
      excel = Creek::Book.new file.path, check_file_extension: true
      # Item.items_import excel
    rescue Exception => e
      @error=e.message
    end
  end


  def search
    @items = Item.all.where('name ILIKE ?', "%#{params[:search][:item_name]}%")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
    @categories = ItemCategory.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:document,
                                 :sku,
                                 :name,
                                 :brand,
                                 :lot,
                                 :manufacture_at,
                                 :expire_at,
                                 :supplier,
                                 :description,
                                 :price,
                                 :stock_amount,
                                 :item_unit,
                                 :cost_price,
                                 :item_category_id,
                                 :supplier_id,
                                 :item_img,
                                 :discount,
                                 :is_online,
                                 :published)
  end
end
