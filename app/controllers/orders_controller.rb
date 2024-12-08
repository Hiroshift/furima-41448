class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
     pay_item
     @order_form.save
     redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  #トークンに関しては未実装
  def order_form_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]   # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_form_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end