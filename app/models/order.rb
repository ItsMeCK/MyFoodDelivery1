class Order < ApplicationRecord
	has_many :order_items
	before_save :update_subtotal
	has_one :time_slot
	has_many :food_items, through: :order_items
	has_one :delivery_boy
	validates :address_id, :user_id, presence: true, :if => :before_placing_order

	def self.process_order(object_id)
		order = Order.find_by_id(object_id)
		#one delivery boy can have 20 per day and 10 in time slot logic is not implemented
		delivery_boy = DeliveryBoy.where(locality_id: 1).first
		order.update(delivery_boy_id: delivery_boy.id, status: 'Confirmed')
	end

	def subtotal
	  order_items.collect { |oi| oi.valid? ? (oi.quantity.to_i * oi.food_item.price.to_f) : 0 }.sum
	end

	def before_placing_order
		status == 'Placed'
	end

	private
	
	def update_subtotal
	  self[:total] = subtotal
	end
end