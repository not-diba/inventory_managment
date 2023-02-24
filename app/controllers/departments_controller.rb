# frozen_string_literal: true

class DepartmentsController < ApplicationController
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
      redirect_to :action => 'index'
    else
      # TODO: flash message here
      render action: 'new'
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])

    if @department.update_attributes(department_params)
      redirect_to action: 'show', id: @department
    else
      render action: 'edit'
    end
  end

  def delete
    Department.find(params[:id]).destroy
    redirect_to action: 'list'
  end

  private

  def department_params
    params.require(:departments).permit(:department_name)
  end
end
