# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :authenticate, only: :destroy
  before_action :authorize

  def new; end

  def create
    administrator = Administrator.find_by_email(params[:email])
    if administrator&.authenticate(params[:password])
      session[:administrator_id] = administrator.id
      redirect_to root_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:administrator_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
