class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]
  extend UpdateStore

  # GET /expenses or /expenses.json
  def index
    @expenses = Expense.all
  end

  # GET /expenses/1 or /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses or /expenses.json
  def create
    begin
      ActiveRecord::Base.transaction do
        @expense = Expense.new(expense_params)
        respond_to do |format|
          if @expense.save!
            unless ExpensesController.balance(@expense,params[:expense][:price].to_i,@configurations)
              raise "Store failed to update balance"
            end
            format.html { redirect_to @expense, notice: "Expense was successfully created." }
            format.json { render :show, status: :created, location: @expense }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @expense.errors, status: :unprocessable_entity }
          end
        end
      end
      rescue Exception => e
      ActiveRecord::Rollback
      flash.now[:error]="Error:#{e.message}"
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
     begin
      ActiveRecord::Base.transaction do
        respond_to do |format|
          if @expense.update(expense_params)
            if @expense.cash_in?
              @configurations.balance = @configurations.balance + params[:expense][:price].to_i
            elsif @expense.cash_out?
              @configurations.balance = @configurations.balance -  params[:expense][:price].to_i
            end
            @configurations.save!
            format.html { redirect_to @expense, notice: "Expense was successfully updated." }
            format.json { render :show, status: :ok, location: @expense }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @expense.errors, status: :unprocessable_entity }
          end
        end 
      end
      rescue Exception => e
      ActiveRecord::Rollback
      flash.now[:error]="Error:#{e.message}"
      render :new, status: :unprocessable_entity 
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: "Expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:price, :expense_type, :remarks, :store_configuration_id)
    end
end
