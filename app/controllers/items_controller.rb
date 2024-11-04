class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @items_exist = Item.exists?
    @items = Item.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :category_id, :price, :shipping_fee_id, :explanation, :condition_id,
                                 :sender_address_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    return if @item.user == current_user

    redirect_to root_path
  end
end
