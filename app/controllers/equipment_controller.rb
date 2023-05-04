# frozen_string_literal: true

class EquipmentController < ApplicationController
  before_action :authenticate
  before_action :authorize

  def index
    @equipment = Equipment.all
    return unless params[:sort]

    @equipment = Equipment.order(params[:sort])
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def new; end

  def create
    @lab = Lab.find(params[:lab_id])
    @equipment = @lab.equipment.create(equipment_params)
    redirect_to lab_path(@lab)
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def update
    @equipment = Equipment.find(params[:id])

    if @equipment.update(equipment_params)
      redirect_to @equipment
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def delete
    @equipment = Equipment.find(params[:id])
    @equipment.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def equipment_params
    params.require(:equipment).permit(:equipment_name, :make, :serial_number, :model_number, :status, :remarks)
  end
end
