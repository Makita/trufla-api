class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :department, :promo_code
end