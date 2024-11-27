class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_owner, only: [:index, :create]
  before_action :check_if_sold, only: [:index, :create]

  def redirect_if_owner
    @item = Item.find(params[:item_id])
    return unless @item.user_id == current_user.id

    redirect_to root_path, alert: '自身が出品した商品の購入ページにはアクセスできません。'
  end

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :sender_address_id, :city, :street_number, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    item = Item.find(order_params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def check_if_sold
    item = Item.find(params[:item_id])
    return unless item.sold?

    redirect_to root_path, alert: '商品はすでに売り切れています。'
  end
end
