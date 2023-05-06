# frozen_string_literal: true

class DepartmentsController < ApplicationController
  before_action :authenticate
  before_action :authorize
  before_action :find_department, only: %i[edit show update destroy]

  def index
    @departments = Department.all
  end

  def show; end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to action: 'index'
    else
      # TODO: flash message here
      render action: 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @department.update(department_params)
      redirect_to @department
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @department.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def find_department
    @department = current_resource
  end

  def department_params
    params.require(:department).permit(:department_name, :location, :description)
  end

  def current_resource
    @current_resource ||= Department.find(params[:id]) if params[:id]
  end
end
