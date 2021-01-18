class OrdersController < ApplicationController
  def index
    @items = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @items = Item.find(params[:item_id])
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private
  def user_order_params
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number)
  end
end