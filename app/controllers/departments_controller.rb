class DepartmentsController < ApplicationController
  def index
    @departments = Department.all.select("id", "name")

    render json: @departments.as_json
  end
end
