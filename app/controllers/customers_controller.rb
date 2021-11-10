class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def auto_search
     search = {first_name_cont: params[:q],last_name_cont: params[:q],id_eq: params[:q],city_cont: params[:q],phone_number_cont:params[:q],m:'or'}
    @customers = Customer.ransack(search).result(distinct: true)


    respond_to do |format|
      format.html{}
      format.json{
      } 
    end
  end

  def index
    @customers = Customer.includes(:sales).paginate(page: params[:page], per_page: 20)
    @total_remaining = @customers.sum(:remaining_amount).to_i
  end

  def new
    @customer = Customer.new
  end

  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.store_configuration_id = @configurations.id
    if @customer.save
      flash[:notice] = 'Customer was successfully created.'
      redirect_to @customer
    else
      render action: 'new'
    end
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = 'Customer was successfully updated.'
      redirect_to @customer
    else
      render action: 'edit'
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:first_name,
                                     :last_name,
                                     :phone_number,
                                     :email_address,
                                     :address,
                                     :city,
                                     :state,
                                     :zip,
                                     :published)
  end
end
