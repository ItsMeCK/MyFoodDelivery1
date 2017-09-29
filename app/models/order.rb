class Order < ApplicationRecord
	has_many :order_items
	before_save :update_subtotal
	belongs_to :time_slot, optional: true
	has_many :food_items, through: :order_items
	belongs_to :delivery_boy, optional: true
	belongs_to :address, optional: true
	validates :address_id, :user_id, presence: true, :if => :before_placing_order
	# validates :time_slot, presence: true, allow_nil: true
	# validates :address, presence: true, allow_nil: true
	# validates :delivery_boy, presence: true, allow_nil: true

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