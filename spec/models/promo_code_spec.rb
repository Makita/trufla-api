require 'rails_helper'

RSpec.describe PromoCode, type: :model do
  context "when validating" do
    before(:each) do
      @promo = PromoCode.new({ code: "FREESTUFF" })
    end

    it "creates correctly with valid attributes" do
      expect(@promo.valid?).to be_truthy
    end

    it "requires a code" do
      @promo.code = nil

      expect(@promo.valid?).to be_falsey
    end

    it "can take a dupe code" do
      Promotion.create({ code: "FREESTUFF" })

      expect(@promo.valid?).to be_truthy
    end
  end
end