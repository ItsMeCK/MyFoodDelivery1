class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :food_item
	before_save :update_subtotal

	def subtotal
	  self.quantity.to_i * self.food_item.price.to_f
	end

	private
	def update_subtotal
	  self.order.update(total: subtotal)
	end
end
