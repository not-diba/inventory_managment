# frozen_string_literal: true

class EquipmentController < ApplicationController
  def index; end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def new; end

  def create
    @lab = Lab.find(params[:lab_id])
    params[:equipment].merge!({ room_id: @lab.id })
    @equipment = @lab.equipment.create(equipment_params)
    redirect_to lab_path(@lab)
  end

  def edit; end

  def update; end

  def delete; end

  private

  def equipment_params
    params.require(:equipment).permit(:equipment_name, :make, :serial_number, :model_number, :status, :remarks,
                                      :room_id)
  end
end
