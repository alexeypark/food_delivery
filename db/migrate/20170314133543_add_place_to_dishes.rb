class AddPlaceToDishes < ActiveRecord::Migration[5.0]
  def change
    add_reference :dishes, :place, foreign_key: true
  end
end
