class AddDiscountPriceItems < ActiveRecord::Migration[5.2]
  def up
    add_column :items,:discount,:integer
  end

  def down
    remove_column :items,:discount,:integer
  end
end
