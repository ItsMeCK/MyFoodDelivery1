json.extract! food_item, :id, :name, :item_image, :food_type, :locality_id, :created_at, :updated_at
json.url food_item_url(food_item, format: :json)
