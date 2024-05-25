class ItemsController < ApplicationController
  before_action :find_item, only: %i[show update destroy]

  # GET /items
  def index
    @items = Item.all

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item, status: :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item = find_item
    @item.destroy
    render json: @item, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_item
    @item = Item.find(params[:id])
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :item_type, :stock, :price, :thumbnail, :description)
  end
end
