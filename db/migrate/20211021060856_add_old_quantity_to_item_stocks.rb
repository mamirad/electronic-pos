class AddOldQuantityToItemStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :item_stocks, :old_quantity, :integer
  end
end
