class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    dish = Dish.find(params[:dish_id])
    place = dish.place
    @cart = Cart.where(user: current_user, place: place).first
    @line_item = @cart.add_dish(dish.id)

      if @line_item.save
        redirect_to :back, notice: "Dish has been added!"
      else
        redirect_to :back, notice:  "Something went wrong!"
      end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js {}
    end
  end

end
