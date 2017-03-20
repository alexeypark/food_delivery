class Order < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :order_items, dependent: :destroy

  validates :user, presence: true
  validates :place, presence: true

  def total_price
    order_items.to_a.sum { |item| item.total_price }
  end
end
