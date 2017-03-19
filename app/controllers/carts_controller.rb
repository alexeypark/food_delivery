class CartsController < ApplicationController
  before_action :set_cart, only: [:destroy]

  def destroy
    @cart.destroy
    redirect_to :back
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

end
