class ItemsController < ApplicationController
  before_action :find_item, only: %i[show update destroy]

  def index
    @items = Item.all

    render json: @items
  end

  def show
    render json: @item
  end

  def create
    @item = Item.create!(item_params)
    render json: @item, status: :created, location: @item
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def update
    @item.update!(item_params)
    render json: @item, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def destroy
    @item.destroy
    render json: @item, status: :no_content
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def find_item
    @item = Item.find(params[:id])
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  def item_params
    params.require(:item).permit(:name, :item_type, :stock, :price, :thumbnail, :description)
  end
end
