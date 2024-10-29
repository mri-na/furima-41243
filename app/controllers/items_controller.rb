class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :category_id, :price, :shipping_fee_id, :explanation, :condition_id, :sender_address_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

end
