class LineItem < ActiveRecord::Base
  belongs_to :sale
  belongs_to :item
  has_many :payments, through: :sale

  
end
