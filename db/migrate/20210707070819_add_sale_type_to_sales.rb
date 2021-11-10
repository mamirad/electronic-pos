class AddSaleTypeToSales < ActiveRecord::Migration[5.2]
  def up
    add_column :sales, :sale_type, :integer,null:false,default:0
    add_column :sales, :sale_status, :integer,null:false,default:0
  end

  def down
    remove_column :sales, :sale_type, :integer
    remove_column :sales, :sale_status, :integer
  end
end
