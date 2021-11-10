json.extract! expense, :id, :price, :expense_type, :remarks, :store_configuration_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
