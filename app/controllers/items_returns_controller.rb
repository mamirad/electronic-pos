class ItemsReturnsController < ApplicationController
  before_action :set_items_return, only: [:show, :edit, :update, :destroy]

  # GET /items_returns
  # GET /items_returns.json
  def index
    @items_returns = ItemsReturn.all
  end

  # GET /items_returns/1
  # GET /items_returns/1.json
  def show
  end

  # GET /items_returns/new
  def new
    @items_return = ItemsReturn.new
  end

  # GET /items_returns/1/edit
  def edit
  end

  # POST /items_returns
  # POST /items_returns.json
  def create
    @items_return = ItemsReturn.new(items_return_params)

    respond_to do |format|
      if @items_return.save
        format.html { redirect_to @items_return, notice: 'Items return was successfully created.' }
        format.json { render :show, status: :created, location: @items_return }
      else
        format.html { render :new }
        format.json { render json: @items_return.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items_returns/1
  # PATCH/PUT /items_returns/1.json
  def update
    respond_to do |format|
      if @items_return.update(items_return_params)
        format.html { redirect_to @items_return, notice: 'Items return was successfully updated.' }
        format.json { render :show, status: :ok, location: @items_return }
      else
        format.html { render :edit }
        format.json { render json: @items_return.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items_returns/1
  # DELETE /items_returns/1.json
  def destroy
    @items_return.destroy
    respond_to do |format|
      format.html { redirect_to items_returns_url, notice: 'Items return was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_return
      @items_return = ItemsReturn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def items_return_params
      params.require(:items_return).permit(:quantity, :return_at, :item_id)
    end
end
