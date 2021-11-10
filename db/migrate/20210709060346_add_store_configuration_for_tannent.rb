class AddStoreConfigurationForTannent < ActiveRecord::Migration[5.2]
  def up
    add_column :sales, :store_configuration_id, :integer
    add_column :items, :store_configuration_id, :integer
    add_column :customers, :store_configuration_id, :integer
  end

  def down
    remove_column :sales, :store_configuration_id, :integer
    remove_column :items, :store_configuration_id, :integer
    remove_column :customers, :store_configuration_id, :integer
  end
end
