class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @cart = Cart.where(user: current_user, place: @place).first
    unless @cart
      @cart = Cart.create(user_id: current_user.id, place_id: @place.id )
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id, :place_id)
  end

end

