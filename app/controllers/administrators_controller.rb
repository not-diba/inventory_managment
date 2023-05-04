# frozen_string_literal: true

class AdministratorsController < ApplicationController
  before_action :authenticate
  before_action :authorize

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

  def show
    @administrator = Administrator.find(params[:id])
  end

  def edit
    @administrator = Administrator.find(params[:id])
  end

  def update
    @administrator = Administrator.find(params[:id])

    if @administrator.update(administrator_params)
      redirect_to administrator_path(@administrator)
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @administrator = Administrator.find(params[:id])
    @administrator.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def administrator_params
    params.require(:administrator).permit(:name, :email, :role_id, :department_id, :password, :password_confirmation)
  end
end
