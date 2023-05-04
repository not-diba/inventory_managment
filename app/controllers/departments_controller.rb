# frozen_string_literal: true

class DepartmentsController < ApplicationController
  before_action :authorize

  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

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

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])

    if @department.update(department_params)
      redirect_to @department
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def department_params
    params.require(:department).permit(:department_name, :location, :description)
  end
end
