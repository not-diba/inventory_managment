# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate
  before_action :authorize
  before_action :find_item, only: %i[show destroy]

  def index
    @items = Item.all
    return unless params[:sort]

    @item = Item.order(params[:sort])
  end

  def show; end

  def new; end

  def create
    @lab = Lab.find(params[:lab_id])
    @item = @lab.items.new(item_params)
    if @item.save
      redirect_to assign_path(@lab)
      flash[:notice] = 'Item Assigned.'
    else
      redirect_to assign_path(@lab)
      flash[:error] = @item.errors.full_messages
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
    flash[:error] = 'Item Deleted..'
  end

  private

  def find_item
    @item = current_resource
  end

  def item_params
    params.require(:item).permit(:item_name, :administrator_name, :room_id, :quantity, :unit, :assigned_to, :returned,
                                 :remarks)
  end

  def current_resource
    @current_resource ||= Item.find(params[:id]) if params[:id]
  end
end
