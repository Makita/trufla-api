class PromoCode < ApplicationRecord
  has_many :products

  validates_presence_of :code, :discount
end