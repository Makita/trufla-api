require 'rails_helper'

RSpec.describe PromoCodesController, type: :controller do
  describe 'GET index' do
    it 'returns all promo codes' do
      PromoCode.create(code: 'FREESTUFF', discount: 100.0)
      PromoCode.create(code: 'NOTFREESTUFF', discount: 0.0)
      PromoCode.create(code: 'HALFOFF', discount: 50.0)

      get :index
      hash = JSON.parse(response.body)

      expect(hash.length).to eq(3)
    end
  end
end
