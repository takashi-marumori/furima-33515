class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.order('created_at DESC')
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
    params.require(:item).permit(:title, :explanation, :price, :category_id, :item_status_id,
                                 :burden_id, :prefecture_id, :day_id, :image).merge(user_id: current_user.id)
  end
end
