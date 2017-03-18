class PlacesController < ApplicationController

  def index
    @place = Place.all
  end

  def show
    @cart = Cart.find(params[:user_id, :place_id])
    unless @cart
      @cart = Cart.new(cart_params)
    end
    @place = Place.find(params[:id])
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id, :place_id)
  end

end

