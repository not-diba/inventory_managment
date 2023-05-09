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
      flash[:success] = 'Department Created.'
    else
      flash.now[:error] = @department.errors.full_messages
      render action: 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @department.update(department_params)
      redirect_to departments_table_index_path
      flash[:notice] = 'Department Updated.'
    else
      flash.now[:error] = @department.errors.full_messages
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if current_administrator.department_id == @department.id
        flash[:error] = 'Cannot Delete Department with active administrator.'      
    else
      @department.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
    flash[:notice] = 'Department Deleted.'
    end
  end

  private

  def find_department
    @department = current_resource
  end

  def department_params
    params.require(:department).permit(:department_name, :location, :description, :administrator_id)
  end

  def current_resource
    @current_resource ||= Department.find(params[:id]) if params[:id]
  end
end
