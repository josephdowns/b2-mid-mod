class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
    binding.pry
  end
end