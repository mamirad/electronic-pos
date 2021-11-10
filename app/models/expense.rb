class Expense < ActiveRecord::Base
  acts_as_tenant(:store_configuration)
  enum expense_type: [:cash_in,:cash_out]
  belongs_to :store_configuration
  validates :price, presence: true
  validates :expense_type, presence: true
end
