class ReportsController < ApplicationController
  def index
     sale = Sale.completed.where("sales.created_at>?",Time.now.beginning_of_year)
     @total_sale = sale.group("DATE_TRUNC('month', created_at)").sum(:total_amount)
     @total_own = sale.group("DATE_TRUNC('month', created_at)").sum(:remaining_amount)
     @total_profit = sale.joins(:line_items).group("DATE_TRUNC('month', sales.created_at)").sum('line_items.profit')
    


  end
end
