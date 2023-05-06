# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate
  before_action :authorize
  before_action :find_room, only: %i[edit show update destroy]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def show; end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @room.update(room_params)
      redirect_to rooms_path
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def find_room
    @room = current_resource
  end

  def room_params
    params.require(:room).permit(:room_name, :department_id)
  end

  def current_resource
    @current_resource ||= Room.find(params[:id]) if params[:id]
  end
end
