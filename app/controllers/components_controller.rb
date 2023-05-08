# frozen_string_literal: true

class ComponentsController < ApplicationController
  before_action :authenticate
  before_action :authorize
  before_action :find_component, only: %i[edit show update destroy]

  def index
    @components = Component.all
    return unless params[:sort]

    @components = Component.order(params[:sort])
  end

  def show; end

  def new; end

  def create
    @lab = Lab.find(params[:lab_id])
    @component = @lab.components.create(component_params)
    redirect_to lab_path(@lab)
    flash[:success] = 'Component Created.'
  end

  def edit; end

  def update
    if @component.update(component_params)
      redirect_to @component
      flash[:notice] = 'Component Updated.'
    else
      render action: 'edit', status: :unprocessable_entity
      flash[:error] = 'Failed to Update Component.'
    end
  end

  def destroy
    @component.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
    flash[:notice] = 'Component Deleted.'
  end

  private

  def find_component
    @component = current_resource
  end

  def component_params
    params.require(:component).permit(:component_name, :quantity, :unit_id, :returnable, :room_id, :remarks)
  end

  def current_resource
    @current_resource ||= Component.find(params[:id]) if params[:id]
  end
end
