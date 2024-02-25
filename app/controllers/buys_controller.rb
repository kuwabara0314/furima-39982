class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  def index
    if current_user.id == @item.user_id|| Buy.exists?(item_id: @item.id)
      redirect_to root_path
    end
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_shipping_information = BuyShippingInformation.new
  end

  def create
    @buy_shipping_information = BuyShippingInformation.new(buy_params)
    if @buy_shipping_information.valid?
      pay_item
      @buy_shipping_information.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
      )
    end

  def buy_params
    params.require(:buy_shipping_information).permit(:postcode, :prefecture_id, :municipalities, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

end
