class AddDetailPayments < ActiveRecord::Migration[5.2]
  def up
    add_column :payments, :detail, :string
  end
  def down
    remove_column :payments, :detail, :string
  end
end
