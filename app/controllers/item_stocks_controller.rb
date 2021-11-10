class ItemStocksController < ApplicationController
  before_action :set_item_stock, only: %i[ show edit update destroy ]

  # GET /item_stocks or /item_stocks.json
  def index
    options={}
    options[:conditions]={}
    options[:raw_query]=[]
    options[:item_ids]=[]
    options[:raw_query_item_stocks_date]=[]
    options[:raw_query] <<  "brand ILIKE '%#{params[:brand]}%'" if params[:brand].present?

    item_ids = Item.joins(:item_category).where("item_categories.id=?",params[:item_category] )if params[:item_category].present?
    options[:item_ids].push(item_ids.pluck(:id)).flatten.uniq if item_ids.present? 

    options[:raw_query_item_stocks_date].push(params[:start_date].present? ? "item_stocks.created_at >= '#{params[:start_date]}'" : "item_stocks.created_at >= '#{Time.now.at_beginning_of_month}'")
    options[:raw_query_item_stocks_date] <<  "item_stocks.created_at <= '#{params[:end_date]}'" if params[:end_date].present?

    options[:raw_query] = options[:raw_query].join(" and ")
    options[:raw_query_item_stocks_date] = options[:raw_query_item_stocks_date].join(" and ")
    @items_list = Item.all.order(:name).map{|item|[item.id.to_s+'#'+item.name+'('+item.brand+')',item.id]}


    options[:item_ids].push(params[:item_id]).flatten.uniq if params[:item_id].present?
    @items = Item.where(options[:raw_query]).order('items.item_category_id,items.brand')
    options[:item_ids].push(@items.pluck(:id)).flatten.uniq if @items.present?


    
    @stock = ItemStock.where(item_id:options[:item_ids]).where(options[:raw_query_item_stocks_date]).includes(:item)
    @item_stocks = @stock.group(:item_id,:created_at,:remarks).sum(:quantity)
    @item_old_stocks = @stock.group(:item_id,:created_at,:remarks).sum(:old_quantity)
    @item_stocks = @item_stocks.zip(@item_old_stocks).map{|data|data.first.union(data.second)} 
    @filer_reset = (params[:item_categoy].present? || params[:item_name].present? || params[:brand] || params[:end_date].present? ||params[:start_date].present?) ?  true : false
  end

  # GET /item_stocks/1 or /item_stocks/1.json
  def show
  end

  # GET /item_stocks/new
  def new
    @item_stock = ItemStock.new
  end

  # GET /item_stocks/1/edit
  def edit
  end

  # POST /item_stocks or /item_stocks.json
  def create
    item = Item.find(params[:item_stock][:item_id])
    
    @item_stock = ItemStock.new(item_stock_params.merge!(old_quantity:item.stock_amount.to_i))
    @item_stock.store_configuration_id = @configurations.id
    item.stock_amount = item.stock_amount+params[:item_stock][:quantity].to_i
    item.save!

    respond_to do |format|
      if @item_stock.save
        format.html { redirect_to new_item_stock_path, notice: "Item stock was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_stocks/1 or /item_stocks/1.json
  def update
    respond_to do |format|
      if @item_stock.update(item_stock_params)
        format.html { redirect_to @item_stock, notice: "Item stock was successfully updated." }
        format.json { render :show, status: :ok, location: @item_stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_stocks/1 or /item_stocks/1.json
  def destroy
    @item_stock.destroy
    respond_to do |format|
      format.html { redirect_to item_stocks_url, notice: "Item stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_stock
      @item_stock = ItemStock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_stock_params
      params.require(:item_stock).permit(:item_id, :quantity, :remarks)
    end
end
