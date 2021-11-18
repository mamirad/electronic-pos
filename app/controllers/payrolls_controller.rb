class PayrollsController < ApplicationController
  before_action :set_payroll, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[ create ]

  # GET /payrolls or /payrolls.json
  def index
    if params[:employee_id].present?
      @payrolls = Payroll.where(employee_id:params[:employee_id])
    else
      @payrolls = Payroll.enable.includes(:employee)
    end
  end

  # GET /payrolls/1 or /payrolls/1.json
  def show
  end

  # GET /payrolls/new
  def new
    @payroll = Payroll.new
  end

  # GET /payrolls/1/edit
  def edit
  end

  # POST /payrolls or /payrolls.json
  def create
    @payroll = Payroll.new(payroll_params)
    @employee.payrolls.where(employee_id:@employee.id).update_all(status:Payroll.statuses[:disable])
    respond_to do |format|
      if @payroll.save
        format.html { redirect_to @payroll, notice: "Payroll was successfully created." }
        format.json { render :show, status: :created, location: @payroll }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payrolls/1 or /payrolls/1.json
  def update
    respond_to do |format|
      if @payroll.update(payroll_params)
        format.html { redirect_to @payroll, notice: "Payroll was successfully updated." }
        format.json { render :show, status: :ok, location: @payroll }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payrolls/1 or /payrolls/1.json
  def destroy
    @payroll.destroy
    respond_to do |format|
      format.html { redirect_to payrolls_url, notice: "Payroll was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payroll
      @payroll = Payroll.find(params[:id])
    end
    def set_employee
      @employee = Employee.find(params[:payroll][:employee_id])
    end

    # Only allow a list of trusted parameters through.
    def payroll_params
      params.require(:payroll).permit(:salary, :status, :employee_id)
    end
end
