class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private
  # 全てのストロングパラメーターを1つに統合
  def order_params
    params.require(:user_order).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end