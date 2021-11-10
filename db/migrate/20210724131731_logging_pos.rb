class LoggingPos < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :log_detail
      t.references :logable, polymorphic: true
      t.integer :store_configuration_id
      t.timestamps
    end
  end
end
