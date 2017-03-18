class CombineItemsInCart < ActiveRecord::Migration[5.0]
  def change
  end
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:dish_id).sum(:quantity)
      sums.each do |dish_id, quantity|
        if quantity > 1
          cart.line_items.where(dish_id: dish_id).delete_all
          item = cart.line_items.build(dish_id: dish_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do
        LineItem.create cart_id: line_item.cart_id,
                        dish_id: line_item.dish_id, quantity: 1
      end
      line_item.destroy
    end
  end
end
