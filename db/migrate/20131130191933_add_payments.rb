class AddPayments < ActiveRecord::Migration[4.2]
  def change
  	create_table :payments do |t|
    	t.integer :sale_id
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :payment_type

      t.timestamps
    end
  end
end
