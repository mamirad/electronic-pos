class CreatePayrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :payrolls do |t|
      t.integer :salary
      t.integer :status,default:0
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
