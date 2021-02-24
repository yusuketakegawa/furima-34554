class BuysController < ApplicationController

  def index
    @buy_shipping = BuyShipping.new
  end

  def create
    @buy_shipping = BuyShipping.new(buyshipping_params)
    if @buy_shipping.valid?
      @buy_shipping.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buyshipping_params
    params.require(:buyshipping_params).permit(:address, :prefecture_id, :municipality, :building, :postal_code, :phone_number).merge.(user_id: current_user.id, item_id: @buy_shipping.item_id)
  end

end
