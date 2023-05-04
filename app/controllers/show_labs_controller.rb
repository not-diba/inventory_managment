# frozen_string_literal: true

class ShowLabsController < ApplicationController
  before_action :authenticate
  before_action :authorize

  def show
    @lab = Lab.find(params[:id])
  end
end
