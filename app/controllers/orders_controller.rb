class OrdersController < ApplicationController
  def index
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :sender_address_id, :city, :street_number, :telephone_number,
                                          :order).merge(user_id: current_user.id)
  end
end
