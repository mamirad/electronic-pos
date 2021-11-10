class Item < ActiveRecord::Base
	acts_as_tenant(:store_configuration)
	mount_uploader :item_img, AvatarUploader
	enum item_unit: [:g, :kg, :piece, :bag ,:carton, :bottle, :drum, :cann, :Lit, :ml]
	belongs_to :supplier
	has_many :line_items
	belongs_to :item_category

	# validates :sku, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	validates :price, presence: true
	validates :stock_amount, presence: true

	def discount_price
		self.discount.present? ? self.discount : self.price
	end
	def strip_string val
    val.strip
  end

  def total_quantity
  	stock_amount.to_i+amount_sold.to_i
  end
	def self.items_import excel
		excel.sheets[0].each do |row|
			debugger
      category = ItemCategory.where("name ILIKE ?","'%#{strip_string(row[0])}%'")
      unless category.present?
        category = ItemCategory.create(name: strip_string(row[0]))
      end
      supplier = supplier.where("name ILIKE ?","'%#{strip_string(row[2])}%'")
      unless supplier.present?
        supplier = Supplier.create(name: strip_string(row[2]))
      end
      unit = Item.item_units[strip_string(row[7])]
      unit = unit.present? ? unit : 'g'

      Item.new(item_category_id:category.id,name:strip_string(row[3]),
      	brand:strip_string(row[1]),price:strip_string(row[4]),
      	cost_price:strip_string(row[5]),stock_amount:strip_string(row[6]),item_unit:unit,
      	manufacture_at:strip_string(row[8]),expire_at: strip_string(row[9]),published:true)
    end
	end
end
