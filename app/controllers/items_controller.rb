class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @item_infos = ItemInfo.all
  end

  def new
    @item_info = ItemInfo.new
  end

  def create
    @item_info = ItemInfo.new(item_params)
    if @item_info.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  
  def item_params
    params.require(:item_info).permit(:item_name, :item_detail, :category_id, :status_id, :shipping_fee_id, :prefecture_from_id, :deliver_date_id, :price, :image).merge(user_id: current_user.id )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
