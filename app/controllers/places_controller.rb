class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    if user_signed_in?
      @cart = Cart.where(user: current_user, place: @place).first_or_create do |cart|
        cart.user = current_user
        cart.place = @place
      end
    end
  end

end