# frozen_string_literal: true

class AdministratorsController < ApplicationController
  before_action :authenticate
  before_action :authorize
  before_action :find_administrator, only: %i[edit show update destroy]

  def index
    @administrators = Administrator.all

    return unless params[:sort]

    @administrators = Administrator.order(params[:sort])
  end

  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      redirect_to administrators_path, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @administrator.update(administrator_params)
      redirect_to administrator_path(@administrator)
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    unless current_resource == current_administrator
      @administrator.destroy

      respond_to do |format|
        format.js { render inline: 'location.reload();' }
      end
    end
    puts('Flash Message')
    # TODO: unauthorized action
    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def find_administrator
    @administrator = current_resource
  end

  def administrator_params
    params.require(:administrator).permit(:name, :email, :role_id, :department_id, :password, :password_confirmation)
  end

  def current_resource
    @current_resource ||= Administrator.find(params[:id]) if params[:id]
  end
end
