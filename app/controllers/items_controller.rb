class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]

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
       if current_user.id == item.user_id
      item.destroy
      redirect_to root_path
       end
    end

    def  edit
      @item = Item.find(params[:id])
      redirect_to root_path unless current_user.id == @item.user_id
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to root_path
      else
        render :edit
      end
    end

  private
  def item_params
    params.require(:item).permit(:name, :item_explanation, :price, :prefecture_id,:shipping_date_id,:status_id,:category_id,:delivery_fee_id, :image).merge(user_id: current_user.id)
  end
end
