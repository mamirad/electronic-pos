json.extract! employee, :id, :name, :cnic, :phone, :job_rank, :dob, :city, :permanent_address, :current_address, :doj, :image, :store_configuration_id, :remarks, :martial_status, :status, :father_spouse_name, :mobile, :created_at, :updated_at
json.url employee_url(employee, format: :json)
