class AddAttrItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :items, :supplier, :string
  	add_column :items, :manufacture_at, :date
  	add_column :items, :expire_at, :date
  	add_column :items, :min_items, :integer
  	add_column :items, :item_unit, :integer
  	add_column :items, :status, :integer
  	add_column :items, :document, :string
  	add_column :items, :lot, :integer
  end
end
