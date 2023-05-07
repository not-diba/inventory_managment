# frozen_string_literal: true

class UnitsController < ApplicationController
  before_action :authenticate
  before_action :authorize
  before_action :find_unit, only: %i[edit update destroy]

  def index
    @units = Unit.all
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      redirect_to units_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @unit.update(unit_params)
      redirect_to unit_params
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @unit.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def find_unit
    @unit = current_resource
  end

  def unit_params
    params.require(:unit).permit(:unit_name)
  end

  def current_resource
    @current_resource ||= Unit.find(params[:id]) if params[:id]
  end
end
