class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = item.find(params[:id])
    item.update(item_params)
  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :carriage_id, :prefecture_id, :schedule_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
