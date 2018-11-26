class ProductsController < ApplicationController
  def index
    @products = Product.all.joins(:department).joins(:promo_code).select("id", "name", "price", "departments.name as dept_name", "promo_codes.code", "promo_codes.discount")

    if params[:department]
      @products = @products.where("departments.id = ?", params[:department])
    end

    if params[:promo_code]
      @products = @products.where("promo_codes.id = ?", params[:promo_code])
    end

    @products = @products.where("products.name LIKE ?", "#{params[:search]}%")

    @products = @products.offset(params[:start].to_i - 1).limit(params[:end].to_i - params[:start].to_i)

    render json: @products.as_json
  end
end