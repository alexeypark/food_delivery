class AddPlaceToCart < ActiveRecord::Migration[5.0]
  def change
    add_reference :carts, :place, foreign_key: true
  end
end
