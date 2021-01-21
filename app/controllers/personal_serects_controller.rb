class PersonalSerectsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_params , only: [:index, :create]
  def index
    redirect_to root_path if  current_user.id == @item.user.id ||@item.personal != nil
    @personal_serect = PersonalSerect.new
  end
  def create
    @personal_serect = PersonalSerect.new(code_id)
    if @personal_serect.valid?
      pay_item
      @personal_serect.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def code_id
    params.require(:personal_serect).permit(:postal_code,:municipality,:address,:phone_number,:delivery_area_id,:building_name).merge(item_id: params[:item_id],user_id: current_user,token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: code_id[:token],
        currency: 'jpy'
      )
  end

  def item_params 
    @item = Item.find(params[:item_id])
  end
end