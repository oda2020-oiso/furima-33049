class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
  end

  private

  def item_params
    params.require(:item).merge(item_id: params[:item_id])
  end

end
