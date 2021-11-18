class Payroll< ActiveRecord::Base
  belongs_to :employee
  enum status: [:enable,:disable]
end
