##
# Allows filtering based on query params.
# Example: url.com/1/21?department=1&promo_code=1&search=Product
#
# Based on the above:
# start: 1
#   The offset of records. How many records to skip before we start returning any.
# end: 21
#   A value relative to the start. Subtract start to get the number of records to return.
# department.id: 1
#   The ID of the department associated with this product.
# promo_code.id: 1
#   The ID of the promo code associated with this product.
# search: Product
#   The beginning of or the full name of a product.

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/LineLength
class ProductsController < ApplicationController
  def index
    @products = Product.all.joins(:department).joins(:promo_code).select('id', 'name', 'price', 'departments.name as dept_name', 'promo_codes.code', 'promo_codes.discount')

    if params[:department]
      @products = @products.where('departments.id = ?', params[:department])
    end

    if params[:promo_code]
      @products = @products.where('promo_codes.id = ?', params[:promo_code])
    end

    @products = @products.where('products.name LIKE ?', "#{params[:search]}%")

    offset = params[:start].to_i - 1
    limit = params[:end].to_i - params[:start].to_i
    @products = @products.offset(offset).limit(limit)

    render json: @products.as_json
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/LineLength
