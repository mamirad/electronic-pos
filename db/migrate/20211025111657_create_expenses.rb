class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.integer :price
      t.integer :expense_type
      t.string :remarks
      t.references :store_configuration, foreign_key: true

      t.timestamps
    end
  end
end
