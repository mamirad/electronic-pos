class PaymentsController < ApplicationController
  extend UpdateStore
  def make_payment
    begin
      ActiveRecord::Base.transaction do
        @sale = Sale.find(params[:payments][:sale_id])
        @paid = Payment.create!(payment_type:'credit',amount: params[:payments][:amount],sale_id: params[:payments][:sale_id])
        @payments = @sale.payments
        @sale.remaining_amount = @sale.total_amount.to_i - (@payments.pluck(:amount).inject(&:+).to_i)
        @sale.save!
        @expense = Expense.create!(price: params[:payments][:amount].to_i,expense_type:Expense.expense_types[:cash_in],remarks:"Invoice# #{@sale.id} Amount ")
        unless PaymentsController.balance(@expense,params[:payments][:amount].to_i,@configurations)
          raise "Store failed to update balance"
        end
        send_msg(@sale.customer,params[:payments][:amount]) if @sale.customer.present? && @sale.customer.phone_number.present?
        
        flash.now[:success]="Payment Processed"
      end
    rescue Exception => e
      ActiveRecord::Rollback
      flash.now[:error]="Error:#{e.message}"
      
    end
    


    respond_to do |format|
      format.js
    end
  end

  private

  def send_msg customer,debit
    msg = "Dear #{customer.full_name}
    Amt Details:
    Old Amt=Rs: #{customer.balance.to_i+debit.to_i}
    Paid Amt= Rs:#{debit.to_i}
    Remaining Amt=Rs: #{customer.balance.to_i}"
    sms = SmsService::Sms.new(@sale.customer.international_phone_format,msg)
    response = sms.send
    flash[:error] = response.message 
  end

  def payment_params
    params.require(:payment).permit(:payment_type, :amount, :sale_id)
  end
end
