class LineItem < ApplicationRecord
  belongs_to :dish
  belongs_to :cart
end
