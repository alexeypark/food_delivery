class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :destroy]

  def index
    @carts = Cart.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = @cart.create(cart_params)

    respond_to do |format|
      format.html {redirect_to dishes_path}
      format.js {}
    end
  end

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

  def cart_params
    params.require(:cart).permit(:user_id, :place_id)
  end
end
