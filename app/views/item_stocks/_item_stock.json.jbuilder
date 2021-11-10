json.extract! item_stock, :id, :item_id, :quantity, :remarks, :created_at, :updated_at
json.url item_stock_url(item_stock, format: :json)
