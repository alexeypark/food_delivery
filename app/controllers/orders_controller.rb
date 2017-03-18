class OrdersController < ApplicationController
  def create
    place = Place.find(params[:place_id])
    cart = Cart.where(user: current_user, place: place).first
    order = Order.create(user: current_user, place: place)
    cart.line_items.each do |item|
      OrderItem.create(name: item.dish.name, price: item.dish.price, quantity: item.quantity, order: order)
    end
    cart.destroy
    redirect_to :back
  end

  def index

  end
end
