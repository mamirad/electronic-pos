class AddProfitLineItems < ActiveRecord::Migration[5.2]
  def up
    add_column :line_items, :profit, :integer
  end

  def down
    remove_column :line_items, :profit, :integer
  end
end
