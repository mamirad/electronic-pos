class AddAvatarItem < ActiveRecord::Migration[5.2]
  def up
    add_column :items,:item_img,:string
  end
  def down
     remove_column :items,:item_img,:string
  end
end
