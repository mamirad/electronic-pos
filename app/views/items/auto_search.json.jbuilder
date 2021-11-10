json.items do
	json.array!(@items) do |item|
		json.name item.name
		json.id item.id
		json.price item.price
		json.brand item.brand
		json.stock_amount item.stock_amount
		json.amount_sold item.amount_sold
	end
end