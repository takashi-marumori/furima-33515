class OrdersController < ApplicationController
  def index
    @items = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @items = Item.find(params[:item_id])
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def user_order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :price).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = "###"
    Payjp::Charge.create(
      amount: user_order_params[:price],
      card: user_order_params[:token],
      currency: 'jpy'
    )
  end
end