# frozen_string_literal: true

class AdministratorsController < ApplicationController
  # before_action :authorize

  def index
    @administrators = Administrator.all

    return unless params[:sort]

    @administrators = Administrator.order(params[:sort])
  end

  def new
    @administrator = Administrator.new
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

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      session[:user_id] = @administrator.id
      redirect_to administrators_path, notice: 'Thank you for signing up!'
    else
      render 'new'
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
    # TODO: change department_id to name using a drop down menu
    params.require(:administrator).permit(:name, :email, :role, :department_id, :password, :password_confirmation)
  end
end
