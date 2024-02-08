class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :day_required_id, :price, :image).merge(user_id: current_user.id)
  end


end
