class User < ApplicationRecord
  has_many :carts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 25 }
  validates :address, presence: true
  validates :phone, presence: true, length: { minimum: 6, maximum: 20 }

  def role?(r)
    role.include? r.to_s
  end

end
