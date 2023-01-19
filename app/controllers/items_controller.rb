class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  
  def index
    @item_infos = ItemInfo.includes(:user).order("created_at DESC")
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

  def edit
    unless user_signed_in? && current_user.id == @item_info.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item_info.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
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

  def set_item
    @item_info = ItemInfo.find(params[:id])
  end

end
