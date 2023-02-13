class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item

  def index
    @order_purchase = OrderPurchase.new
    return redirect_to root_path if current_user.id == @item_info.user_id || @item_info.purchase_record.present?
  end

  def create
    @order_purchase = OrderPurchase.new(shipping_params)
    if @order_purchase.valid?
      pay_item
      @order_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipping_params
    params.require(:order_purchase).permit(:postal_code, :prefecture_from_id, :city, :addresses, :building, :phone_number, :price).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]    # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item_info.price, # 商品の値段
      card: shipping_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item_info = ItemInfo.find(params[:item_id])
  end
end
