# frozen_string_literal: true

class AdministratorsController < ApplicationController
  # before_action :authorize
  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      session[:user_id] = @administrator.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  private

  def administrator_params
    # TODO: change department_id to name using a drop down menu
    params.require(:administrator).permit(:name, :email, :role, :department_id, :password, :password_confirmation)
  end
end
