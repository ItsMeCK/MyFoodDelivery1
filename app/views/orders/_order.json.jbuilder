json.extract! order, :id, :user_id, :address_id, :time_slot_id, :delivery_boy_id, :status, :payment_id, :created_at, :updated_at
json.url order_url(order, format: :json)
