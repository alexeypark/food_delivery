class DishesController < InheritedResources::Base

  private

    def dish_params
      params.require(:dish).permit(:name, :price, :description, :place_id)
    end
end

