class AddBalanceToStoreConfiguration < ActiveRecord::Migration[5.2]
  def change
    add_column :store_configurations, :balance, :integer, default:0
  end
end
