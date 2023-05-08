# frozen_string_literal: true

class EquipmentController < ApplicationController
  before_action :authenticate
  before_action :authorize
  before_action :find_equipment, only: %i[edit show update destroy]

  def index
    @equipment = Equipment.all
    return unless params[:sort]

    @equipment = Equipment.order(params[:sort])
  end

  def show; end

  def new; end

  def create
    @lab = Lab.find(params[:lab_id])
    @equipment = @lab.equipment.create(equipment_params)
    redirect_to lab_path(@lab)
    flash[:success] = 'Equipment Created.'
  end

  def edit; end

  def update
    if @equipment.update(equipment_params)
      redirect_to @equipment
      flash[:notice] = 'Equipment Updated.'
    else
      render action: 'edit', status: :unprocessable_entity
      flash[:error] = 'Failed to Update Equipment.'
    end
  end

  def destroy
    @equipment.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
    flash[:notice] = 'Equipment Deleted..'
  end

  private

  def find_equipment
    @equipment = current_resource
  end

  def equipment_params
    params.require(:equipment).permit(:equipment_name, :make, :serial_number, :model_number, :status, :remarks,
                                      :room_id)
  end

  def current_resource
    @current_resource ||= Equipment.find(params[:id]) if params[:id]
  end
end
