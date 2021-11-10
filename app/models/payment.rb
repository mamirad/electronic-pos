class Payment < ActiveRecord::Base
  belongs_to :sale

  def amount_after_change
    value = self.sale.total_amount.to_i - self.amount.to_i

    if value >= 0
      return self.amount.to_i
    else
      return self.sale.total_amount.to_i
    end
  end
end if true
