##
# This class represents a product. Each one has a department and a promo code.
# For no active promo codes, there is instead a default one at ID 1.
class Product < ApplicationRecord
  belongs_to :department
  belongs_to :promo_code

  validates :name, :price, :department, :promo_code, presence: true
end
