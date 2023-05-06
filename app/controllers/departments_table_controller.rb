# frozen_string_literal: true

class DepartmentsTableController < ApplicationController
  before_action :authenticate
  before_action :authorize

  def index
    @departments = Department.all
    return unless params[:sort]

    @departments = Department.order(params[:sort])
  end

  def show
    @department = current_resource
  end

  private

  def current_resource
    @current_resource ||= Department.find(params[:id]) if params[:id]
  end
end
