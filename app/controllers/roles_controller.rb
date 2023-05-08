# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :authenticate
  before_action :authorize

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to roles_path
      flash[:success] = 'Role Created.'
    else
      flash.now[:error] = @role.errors.full_messages
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
    flash[:error] = 'Role Deleted..'
  end

  private

  def role_params
    params.require(:role).permit(:role_name)
  end
end
