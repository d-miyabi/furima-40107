class OrdersController < ApplicationController
  before_action :set_public_key, only: [:index, :create]
  before_action :select_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :redirect_unless_available_to_purchase, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :addresses, :building, :city, :address, :building_name, :house_number, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def select_item
    @item = Item.find(params[:item_id])
  end

  def redirect_unless_available_to_purchase
    return unless @item.order.present? || current_user == @item.user

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_public_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end
end
