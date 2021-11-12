class AddAttrsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :father_or_spouse, :string
    add_column :customers, :salary_or_income, :integer
    add_column :customers, :job_or_work_address, :string
    add_column :customers, :cnic_no, :string
    add_column :customers, :job_duration, :string
    add_column :customers, :present_address, :string
    add_column :customers, :house_ownership, :integer,default:0
    add_column :customers, :permanent_address, :string
    add_column :customers, :cast, :string
    add_column :customers, :check_no, :string
    add_column :customers, :dob, :string
    add_column :customers, :bank, :string
    add_column :customers, :profession_or_rank, :string
    add_column :customers, :check_ownership, :integer,default:0

  end
end
