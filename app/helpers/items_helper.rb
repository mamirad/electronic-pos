module ItemsHelper
	def expire_at(date)
		if date && date>Time.now.to_date
			"text-success"
		else
			"text-danger"
		end
	end
end
