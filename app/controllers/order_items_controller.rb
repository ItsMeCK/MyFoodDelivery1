class OrderItemsController < ApplicationController
  before_action :check_user
  def check_user
    return if user_signed_in?
    redirect_to new_user_session_path, error: 'You must log on to view this part of the site'
  end
  
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save!
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :food_item_id)
  end
end
