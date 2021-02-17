class OrdersController < ApplicationController
before_action :authenticate_user!, only: [:create, :index, :new]

  def index
    @item = Item.find(item.id)
  end

  def new
    @order_distribution = OrderDistribution.new
  end

  def create
    @order_distribution = OrderDistribution.new(order_params)
    if @order_distribution.valid?
      pay_item
      @order_distribution.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def order_params
    params.require(:order_distribution).permit(:postal_code, :prefecture, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, order_id: order_params.id, item_id: item_params.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end