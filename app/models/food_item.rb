class FoodItem < ApplicationRecord
	has_many :order_items
	has_many :orders, through: :order_items
	after_save :expire_cache

	def self.all_food_items
		all
	end

	def expire_cache
		 Rails.cache.delete('recent_items')
	end
end
