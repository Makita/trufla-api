require 'rails_helper'

RSpec.describe Department, type: :model do
  context "when validating" do
    before(:each) do
      @department = Department.new({ name: "Trufla" })
    end

    it "creates correctly with valid attributes" do
      expect(@department.valid?).to be_truthy
    end

    it "requires a name" do
      @department.name = nil

      expect(@department.valid?).to be_falsey
    end

    it "requires a unique name" do
      Department.create({ name: "Trufla" })

      expect(@department.valid?).to be_falsey
    end
  end
end