class Log < ActiveRecord::Base
	acts_as_tenant(:store_configuration)
end