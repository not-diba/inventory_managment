# frozen_string_literal: true

class DepartmentsTableController < ApplicationController
  before_action :authenticate
  before_action :authorize

  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end
end
