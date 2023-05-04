# frozen_string_literal: true

class DepartmentsTableController < ApplicationController
  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end
end
