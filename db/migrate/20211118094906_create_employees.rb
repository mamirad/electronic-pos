class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :cnic
      t.string :phone
      t.integer :job_rank,default:0
      t.date :dob
      t.string :city
      t.string :permanent_address
      t.string :current_address
      t.date :doj
      t.string :image
      t.integer :store_configuration_id
      t.string :remarks
      t.integer :martial_status,default:0
      t.integer :status,default:0
      t.string :father_spouse_name
      t.string :mobile

      t.timestamps
    end
  end
end
