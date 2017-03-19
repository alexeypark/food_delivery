class Place < ApplicationRecord
  has_many :dishes
  has_many :carts

  has_attached_file :image,
                    styles: { medium: '300x300#', thumb: '100x100#' }
  validates_attachment_content_type :image,
                                    content_type: /\Aimage\/.*\z/

end
