# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_administrator
    @current_administrator ||= Administrator.find(session[:administrator_id]) if session[:administrator_id]
  end
  helper_method :current_administrator

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_administrator.nil?
  end
end
