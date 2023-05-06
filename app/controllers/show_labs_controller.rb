# frozen_string_literal: true

class ShowLabsController < ApplicationController
  before_action :authenticate
  before_action :authorize

  def show
    @lab = current_resource
  end

  private

  def current_resource
    @current_resource ||= Lab.find(params[:id]) if params[:id]
  end
end
