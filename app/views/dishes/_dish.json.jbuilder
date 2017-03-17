json.extract! dish, :id, :name, :price, :description, :created_at, :updated_at
json.url dish_url(dish, format: :json)
