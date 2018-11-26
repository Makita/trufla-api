class Product < ApplicationRecord
  belongs_to :department
  belongs_to :promo_code

  validates :name, :price, :department, :promo_code, presence: true
end