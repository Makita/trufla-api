require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do
  describe "GET index" do
    it "returns all departments" do
      Department.create({ name: "One" })
      Department.create({ name: "Two" })
      Department.create({ name: "Three" })

      get :index
      hash = JSON.parse(response.body)

      expect(hash.length).to eq(3)
    end
  end
end
