require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Product, type: :model do
  context 'when validating' do
    before(:each) do
      @department = Department.create(name: 'Trufla')
      @promo = PromoCode.create(code: 'FREESTUFF', discount: 1.00)
      @product = Product.new(
        name: 'Free Back Rubs',
        price: 1.00,
        department: @department,
        promo_code: @promo
      )
    end

    it 'creates correctly with valid fields' do
      expect(@product.valid?).to be_truthy
    end

    it 'requires a name' do
      @product.name = nil

      expect(@product.valid?).to be_falsey
    end

    it 'requires a price' do
      @product.price = nil

      expect(@product.valid?).to be_falsey
    end

    it 'requires a department' do
      @product.department = nil

      expect(@product.valid?).to be_falsey
    end

    # In production, having no promo code means having promo code #1 ("nopromo")
    it 'requires a promo' do
      @product.promo_code = nil

      expect(@product.valid?).to be_falsey
    end
  end
end
# rubocop:enable Metrics/BlockLength
