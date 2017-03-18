class CartsController < ApplicationController
  before_action :set_cart, only: [:destroy]

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to :back}
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

end
