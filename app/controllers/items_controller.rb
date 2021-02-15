class ItemsController < ApplicationController
  before_action :signed_in, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :carriage_id, :prefecture_id, :schedule_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def signed_in
    redirect_to user_session_path unless user_signed_in?
  end
end
