class OrdersController < ApplicationController
before_action :authenticate_user!, only: [:create, :index, :new]
before_action :item_set, only: [:index, :create]
attr_accessor :token

  def index
    @order_distribution = OrderDistribution.new
  end

  def create
    @order_distribution = OrderDistribution.new(distribution_params)
    if @order_distribution.valid?
        Payjp.api_key = "sk_test_e52b1dd03c6f1bae4115b40b"
        Payjp::Charge.create(
        amount: @item.price,
        card: distribution_params[:token],
        currency: 'jpy'
        )

      @order_distribution.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def distribution_params
    params.require(:order_distribution).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end


  def item_set
    @item = Item.find(params[:item_id])
  end

  # def order_params
  #   params.merge(user_id: current_user.id, item_id: @item.id)
  # end


  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
  #     amount: order_params[:price],  # 商品の値段
  #     card: order_params[:token],    # カードトークン
  #     currency: 'jpy'                 # 通貨の種類（日本円）
  #   )
  # end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
  #     amount: item_params[:price],
  #     card: order_params[:token],
  #     currency: 'jpy'
  #   )
  # end


end