class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_user, only: [new]
  
  def index
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

  private

  def item_params
    params.require(:item).permit(:category_id, :product_condition_id, :shipping_charges_id, :delivery_area_id, :data_of_shipment_id,:image, :product_name, :product_description, :price).merge(user_id: current_user.id)
  end

end