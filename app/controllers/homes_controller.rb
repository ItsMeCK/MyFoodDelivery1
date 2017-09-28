class HomesController < ApplicationController
	def index
		@user = current_user
		@order_item = current_order.order_items.new
	end
end
