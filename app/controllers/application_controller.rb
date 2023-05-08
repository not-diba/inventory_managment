# frozen_string_literal: true

class ApplicationController < ActionController::Base
  delegate :allow?, to: :current_permission
  helper_method :allow?
  add_flash_types :info, :error, :success

  private

  def current_administrator
    @current_administrator ||= Administrator.find(session[:administrator_id]) if session[:administrator_id]
  end
  helper_method :current_administrator

  def authenticate
    redirect_to login_url, error: 'Logged Out.' if current_administrator.nil?
  end

  def current_permission
    @current_permission ||= Permission.new(current_administrator)
  end

  def current_resource
    nil
  end

  def authorize
    return if current_permission.allow?(params[:controller], params[:action], current_resource)

    redirect_to root_path
    flash[:error] = 'Not Authorized. Contact Administrator'
  end
end
