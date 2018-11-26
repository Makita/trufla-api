require 'rails_helper'

# rubocop:disable Metrics/BlockLength
# rubocop:disable Metrics/LineLength
RSpec.describe ProductsController, type: :controller do
  describe 'GET index' do
    before(:each) do
      department = Department.create(name: 'Fun Zone')
      department2 = Department.create(name: 'Non-Fun Zone')
      promo_code = PromoCode.create(code: 'FREESTUFF', discount: 100.0)
      promo_code2 = PromoCode.create(code: 'NOTFREESTUFF', discount: 0.0)
      Product.create(name: 'Product 1', price: 20.00, department: department, promo_code: promo_code)
      Product.create(name: 'Product 2', price: 20.00, department: department, promo_code: promo_code2)
      Product.create(name: 'Product 3', price: 20.00, department: department, promo_code: promo_code2)
      Product.create(name: 'Stuff 1', price: 20.00, department: department, promo_code: promo_code2)
      Product.create(name: 'Stuff 2', price: 20.00, department: department, promo_code: promo_code2)
      Product.create(name: 'Stuff 3', price: 20.00, department: department, promo_code: promo_code2)
      Product.create(name: 'Stuff 4', price: 20.00, department: department2, promo_code: promo_code2)
      Product.create(name: 'Stuff 5', price: 20.00, department: department2, promo_code: promo_code2)
    end

    it 'filters by range properly' do
      get :index, params: { start: 1, end: 4 }
      hash = JSON.parse(response.body)

      expect(hash.length).to eq(3)
    end

    it 'filters by department properly' do
      get :index, params: { start: 1, end: 10, department: 1 }
      hash = JSON.parse(response.body)

      expect(hash.length).to eq(6)
    end

    it 'filters by promo code properly' do
      get :index, params: { start: 1, end: 10, promo_code: 1 }
      hash = JSON.parse(response.body)

      expect(hash.length).to eq(1)
    end

    it 'filters by text search properly' do
      get :index, params: { start: 1, end: 10, search: 'Stuff' }
      hash = JSON.parse(response.body)

      expect(hash.length).to eq(5)
    end

    it 'combines all filters properly' do
      get :index, params: { start: 1, end: 8, department: 1, promo_code: 2, search: 'Stuff' }
      hash = JSON.parse(response.body)

      expect(hash.length).to eq(3)
    end
  end
end
# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/LineLength
