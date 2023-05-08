# frozen_string_literal: true

class LabsController < ApplicationController
  before_action :authenticate
  before_action :authorize
  before_action :find_lab, only: %i[edit show update destroy]

  def index
    @labs = Lab.all
    return unless params[:sort]

    @labs = Lab.order(params[:sort])
  end

  def show; end

  def new; end

  def create
    @department = Department.find(params[:department_id])
    @lab = @department.labs.create(labs_params)
    redirect_to department_path(@department)
  end

  def edit; end

  def update
    if @lab.update(labs_params)
      redirect_to show_lab_path(@lab)
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @lab.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def find_lab
    @lab = current_resource
  end

  def labs_params
    params.require(:lab).permit(:lab_name, :administrator_id)
  end

  def current_resource
    @current_resource ||= Lab.find(params[:id]) if params[:id]
  end
end
