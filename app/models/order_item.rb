class OrderItem < ApplicationRecord
  belongs_to :order
  validates :order, presence: true

  def total_price
    price * quantity
  end
end
