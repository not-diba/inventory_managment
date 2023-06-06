# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :authenticate, only: :destroy
  before_action :authorize

  def new; end

  def create
    administrator = Administrator.find_by_email(params[:email])
    if administrator&.authenticate(params[:password])
      session[:administrator_id] = administrator.id
      redirect_to root_path
      flash[:success] = 'Welcome, ' + administrator.name
    else
      render js: "alert('Invalid Password or Email.')"
    end
  end

  def destroy
    session[:administrator_id] = nil
    redirect_to root_url
    flash[:notice] = 'Logged Out.'
  end
end
