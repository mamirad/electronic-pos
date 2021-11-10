class Supplier < ActiveRecord::Base
	has_one :item
	validates :name, presence: true
	validates :phone, presence: true
end
