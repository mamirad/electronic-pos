class Employee < ActiveRecord::Base
	enum job_rank: [:admin,:sale_man,:cashier,:collector]
	enum status: [:enable,:disable]
	enum martial_status: [:single,:married]
	has_many :payrolls
	
end
