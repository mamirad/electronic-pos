class AddRemainingPayment < ActiveRecord::Migration[5.2]
  def up
    add_column :payments, :remaining_amount, :integer
  end

  def down
    remove_column :payments, :remaining_amount, :integer
  end
end
