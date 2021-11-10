class AddStoreConfigurationIdToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :store_configuration_id, :integer
  end

  def down
    remove_column :users, :store_configuration_id, :integer
  end
end
