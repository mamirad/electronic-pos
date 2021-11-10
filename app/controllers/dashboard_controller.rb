class DashboardController < ApplicationController
  def index
    @stock_in_hand_price = Item.all.inject(0){|e,item| e+(item.stock_amount*item.cost_price)}
    @own_amt = Sale.completed.where('remaining_amount>0').inject(0){|e,sale|e+sale.remaining_amount.to_i}
    @customer_count = Customer.count
    @defaulter_customer = Customer.joins(:sales).where("sales.remaining_amount>0").count
    @amt_in_hand= @configurations.balance




    # @recent_sales = Sale.completed.where("sales.total_amount>=?",0).order('created_at DESC').limit(10)
    # @popular_items = Item.all.order('amount_sold DESC').limit(10)
    #  @total_sale_amount = @recent_sales.pluck(:total_amount).inject(&:+).to_i if @recent_sales.present?
    # @current_sales = Sale.where(id:@recent_sales.pluck(:id))
    # @sale_remaining_amount = @current_sales.sum(:remaining_amount)
    # @total_paid_amount = @current_sales.joins(:payments).sum("payments.amount").to_i
  end

  def create_sale_with_product
    @sale = Sale.create
    item = Item.find(params[:item_id])

    LineItem.create(item_id: params[:item_id].to_i,
                    quantity: params[:quantity].to_i,
                    price: item.price,
                    total_price: item.price * params[:quantity].to_i,
                    sale_id: @sale.id)

    price = (item.price * params[:quantity].to_i)
    @sale.total_amount = price
    @sale.save

    redirect_to controller: 'sales', action: 'edit', id: @sale.id
  end

  def get_tax_rate
    if @configurations.tax_rate.blank?
      return 0.00
    else
      return @configurations.tax_rate.to_f * 0.01
    end
  end
end
