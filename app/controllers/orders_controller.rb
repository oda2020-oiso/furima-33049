class OrdersController < ApplicationController
before_action :authenticate_user!, only: :create

  def create
    @order = Order.create(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require.merge( user_id: current_user.id, item_id: params[:item_id])
  end
end