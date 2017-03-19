class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    if user_signed_in?
      @cart = Cart.where(user: current_user, place: @place).first
      unless @cart
        @cart = Cart.create(user_id: current_user.id, place_id: @place.id )
      end
    end
  end

end