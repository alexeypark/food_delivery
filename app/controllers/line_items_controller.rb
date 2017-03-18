class LineItemsController < ApplicationController

  def create
    dish = Dish.find(params[:dish_id])
    @cart = Cart.find(params[:place_id, :user_id])
    @line_item = @cart.add_dish(dish.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to dishes_path }
        format.js {}
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url }
      format.js {}
    end
  end
end
