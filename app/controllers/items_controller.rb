class ItemsController < ApplicationController
  def index
    @item = Item.new
    # @user = User.find(params[:user_id])
    # @items = @user.items.includes(:user)
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @item = @room.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @items = @user.items.includes(:user)
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_charges_id, :shipping_area_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
    end
end
