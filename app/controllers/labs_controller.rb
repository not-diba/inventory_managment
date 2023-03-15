# frozen_string_literal: true

class LabsController < ApplicationController
  def index; end

  def show
    @department = Department.find(params[:department_id])
    @lab = @department.labs.find(params[:id])
  end

  def new; end

  def create
    @department = Department.find(params[:department_id])
    @lab = @department.labs.create(labs_params)
    redirect_to department_path(@department)
  end

  def edit; end

  def update; end

  def delete; end

  private

  def labs_params
    params.require(:lab).permit(:lab_name)
  end
end
