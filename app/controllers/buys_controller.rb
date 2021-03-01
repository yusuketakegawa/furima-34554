class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
    @buy_shipping = BuyShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_shipping = BuyShipping.new(buyshipping_params)
    if @buy_shipping.valid?
      pay_item
      @buy_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyshipping_params
    params.require(:buy_shipping).permit(:address, :prefecture_id, :municipality, :building, :postal_code, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: buyshipping_params[:token],
      currency: 'jpy'
    )
  end
end
