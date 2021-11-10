class AddBrandSupplierToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :brand, :string
    add_column :items, :supplier_id, :integer
  end
end
