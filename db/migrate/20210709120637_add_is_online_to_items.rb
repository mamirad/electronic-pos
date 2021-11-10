class AddIsOnlineToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :is_online, :boolean,default:true
  end
end
