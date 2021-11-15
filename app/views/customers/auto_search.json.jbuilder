json.customers do
	json.array!(@customers) do |customer|
		json.full_name_with_phone_city customer.full_name_with_phone_city
		json.phone_number customer.phone_number
		json.city customer.city
		json.id customer.id
		json.cnic_no customer.cnic_no
	end
end