class ItemsController < ApplicationController

  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

    def show
      @item = Item.find(params[:id])
    end

    def destroy
      item = Item.find(params[:id])
      item.destroy
      redirect_to root_path
    end

  private
  def item_params
    params.require(:item).permit(:name, :item_explanation, :price, :prefecture_id,:shipping_date_id,:status_id,:category_id,:delivery_fee_id, :image).merge(user_id: current_user.id)
  end
end
