class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :organization
      t.string :email
      t.string :phone
      t.string :slug

      t.timestamps
    end
  end
end
