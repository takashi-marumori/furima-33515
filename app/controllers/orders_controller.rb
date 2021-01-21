class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_items, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def user_order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @items.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @items.price,
      card: user_order_params[:token],
      currency: 'jpy'
    )
  end

  def set_items
    @items = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path unless @items.user_id != current_user.id && @items.order.nil?
  end
end
