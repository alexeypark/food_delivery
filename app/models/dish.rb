class Dish < ApplicationRecord
  belongs_to :place
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, presence: true, length: { maximum: 36 }
  validates :price, presence: true
  validates :place, presence: true

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
  end
end
