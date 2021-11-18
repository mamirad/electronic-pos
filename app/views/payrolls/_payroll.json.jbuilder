json.extract! payroll, :id, :salary, :status, :employee_id, :created_at, :updated_at
json.url payroll_url(payroll, format: :json)
