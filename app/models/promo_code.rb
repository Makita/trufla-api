##
# This class represents a promo code that a product can have active.
class PromoCode < ApplicationRecord
  has_many :products # rubocop:disable Rails/HasManyOrHasOneDependent

  validates :code, :discount, presence: true
end
