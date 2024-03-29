class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :sold_out_root_path, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  # 全てのストロングパラメーターを1つに統合
  def order_params
    params.require(:user_order).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述する
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def sold_out_root_path
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end

  def move_to_root_path
    redirect_to root_path if current_user == @item.user
  end
end
