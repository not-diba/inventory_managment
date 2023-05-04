# frozen_string_literal: true

class ShowLabsController < ApplicationController
  def show
    @lab = Lab.find(params[:id])
  end
end
