class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index, :new]
  before_action :item_set, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  attr_accessor :token

  def index
    @order_distribution = OrderDistribution.new
  end

  def create
    @order_distribution = OrderDistribution.new(distribution_params)
    if @order_distribution.valid?
      pay_item

      @order_distribution.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def distribution_params
    params.require(:order_distribution).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: distribution_params[:token],
      currency: 'jpy'
    )
  end
  if current_user.id == @item.user_id
    redirect_to root_path
  end
end
