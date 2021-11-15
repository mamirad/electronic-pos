class AddAccountNoToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :account_no, :string
  end
end
