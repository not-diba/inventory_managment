# frozen_string_literal: true

class RoomsController < ApplicationController
  def index; end

  def show
    @department = Department.find(params[:department_id])
    @room = @department.rooms.find(params[:id])
  end

  def new; end

  def create
    @department = Department.find(params[:department_id])
    @room = @department.rooms.create(rooms_params)
    redirect_to department_path(@department)
  end

  def edit; end

  def update; end

  def delete; end

  private

  def rooms_params
    params.require(:room).permit(:room_name)
  end
end
