class Place < ApplicationRecord
  has_many :dishes, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :name, presence: true

  has_attached_file :image,
                    styles: { medium: '300x300#', thumb: '100x100#' },
                    default_url: ':style/missing.png'
  validates_attachment_content_type :image,
                                    content_type: /\Aimage\/.*\z/

end
