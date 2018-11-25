class Product < ApplicationRecord
  belongs_to :department
  belongs_to :promo_code
end