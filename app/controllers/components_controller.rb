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
  end

  def edit; end

  def update
    if @component.update(component_params)
      redirect_to @component
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def delete
    @component.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def find_component
    @component = current_resource
  end

  def component_params
    params.require(:component).permit(:component_name, :quantity, :unit, :returnable)
  end

  def current_resource
    @current_resource ||= Component.find(params[:id]) if params[:id]
  end
end
