class CreateItemsReturns < ActiveRecord::Migration[5.2]
  def change
    create_table :items_returns do |t|
      t.integer :quantity
      t.date :return_at
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
