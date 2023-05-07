# frozen_string_literal: true

class AssignController < ApplicationController
  before_action :authenticate
  before_action :authorize
  before_action :find_lab, only: %i[show]

  def show; end

  private

  def find_lab
    @lab = current_resource
  end

  def labs_params
    params.require(:lab).permit(:lab_name)
  end

  def current_resource
    @current_resource ||= Lab.find(params[:id]) if params[:id]
  end
end
