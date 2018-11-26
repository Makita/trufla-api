##
# Just serves all the promo codes as JSON.
class PromoCodesController < ApplicationController
  def index
    @codes = PromoCode.select('id', 'code', 'discount')

    render json: @codes.as_json
  end
end
