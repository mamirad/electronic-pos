class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.all
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
    respond_to do |format|
      format.js{}
      format.html{}
    end
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: 'Supplier was successfully created.' }
        format.json { render :show, status: :created, location: @supplier }
        format.js{flash.now[:success] = 'Supplier was successfully created'}
      else
        @errors = @supplier.errors.to_a
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
        format.js{flash.now[:error] = @errors.to_a}

      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { 
          redirect_to @supplier,
           notice: 'Supplier was successfully updated.'
        }
        format.json {
         render :show, status: :ok, location: @supplier }

      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
        flash[:error] = @supplier.errors.to_a
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.require(:supplier).permit(:name, :phone)
    end
end
