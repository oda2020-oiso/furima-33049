class OrdersController < ApplicationController
  def create
    Order.create(order_params)
    redirect_to "/items/#{order.item.id}"
  end

  private
  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: params[:item_id])
end
