class OrdersController < ApplicationController
  def index
    @items = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
  end
end
