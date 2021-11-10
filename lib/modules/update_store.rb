module UpdateStore
	def balance(expense,price,store)
		store.balance = expense.cash_in? ? store.balance + price : store.balance - price 
    store.save ?  true :  "error"
	end
end