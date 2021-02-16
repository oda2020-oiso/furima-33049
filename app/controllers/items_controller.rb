class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :item_set, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
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
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_set
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :carriage_id, :prefecture_id, :schedule_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
