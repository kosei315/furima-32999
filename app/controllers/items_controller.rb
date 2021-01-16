class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :params_id, only: [:show, :edit, :update]
  def index
    @item = Item.includes(:user).order("updated_at DESC")
  end

  def show
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
    render :new
    end
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user.id
    redirect_to root_path
    end
  end

  def update
   if @item.update(item_params)
    redirect_to item_path(@item)
   else
    render :edit
   end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :product_condition_id, :shipping_charge_id, :delivery_area_id, :data_of_shipment_id,:image, :product_name, :product_description, :price).merge(user_id: current_user.id)
  end

  def params_id
    @item = Item.find(params[:id])
  end
end