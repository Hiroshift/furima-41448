class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
end

private

def item_params
  params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
end
