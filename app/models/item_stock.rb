class ItemStock < ActiveRecord::Base
  acts_as_tenant(:store_configuration)
  belongs_to :item

  validates :item_id, presence: true
  validates :quantity, presence: true
end
