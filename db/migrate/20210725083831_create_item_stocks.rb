class CreateItemStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :item_stocks do |t|
      t.references :item, foreign_key: true
      t.integer :quantity
      t.string :remarks
      t.integer :store_configuration_id

      t.timestamps
    end
  end
end
