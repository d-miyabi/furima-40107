class OrdersController < ApplicationController
  def new
    @order_address = OrderAddress.new
  end

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
  end
end