class OrdersController < ApplicationController
before_action :authenticate_user!, only: [:create, :index, :new]
before_action :item_set, only: [:index, :create]
attr_accessor :token

  def index
    @distribution = Distribution.new
  end

  def create
    # @item = Item.find(params[:item_id]) 
    @distribution = Distribution.new(order_params)
    if @distribution.valid?
      redirect_to root_path
    else
      render action: :index
    end
    # @order_distribution = OrderDistribution.new(order_params)
    # if @order_distribution.valid?
    #   pay_item
    #   @order_distribution.save
    #   redirect_to root_path
    # else
    #   render action: :index
    # end
  end

  private

  def order_params
    params.require(:distribution).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number)
    # params.require(:order,:distribution).permit(:postal_code, :prefecture, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, order_id: order_params.id, item_id: item_params.id, token: params[:token])
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def pay_item
    # Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # Payjp::Charge.create(
    #   amount: order_params[:price],  # 商品の値段
    #   card: order_params[:token],    # カードトークン
    #   currency: 'jpy'                 # 通貨の種類（日本円）
    # )
  end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
  #     amount: item_params[:price],
  #     card: order_params[:token],
  #     currency: 'jpy'
  #   )
  # end


end