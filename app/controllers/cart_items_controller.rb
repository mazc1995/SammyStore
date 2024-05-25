class CartItemsController < ApplicationController
  before_action :find_item, :find_cart, only: %i[create]
  before_action :find_cart_item, only: %i[update destroy]
  before_action :set_data, :find_item, :validate_stock!, only: %i[create update]

  def create
    @cart_item = CartItem.create!(cart: @cart, item: @item, quantity: @quantity, subtotal: subtotal)

    render json: @cart_item, status: :created
  rescue StandardError
    render json: @item.errors, status: :unprocessable_entity
  end

  def update
    if @quantity.zero?
      @cart_item.destroy
    else
      @cart_item.update!(subtotal: subtotal, quantity: @quantity)
    end
    render json: @cart_item, status: :no_content
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def destroy
    @cart_item.destroy
    render json: @cart_item, status: :no_content
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def set_data
    @quantity = params['quantity'].to_i
  end

  def find_item
    @item = if @cart_item
              @cart_item.item
            else
              Item.find(params['item_id'])
            end
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  def find_cart
    @cart = Cart.find(params['cart_id'])
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  def find_cart_item
    @cart_item = CartItem.find(params['id'])
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  def validate_stock!
    raise StandardError, 'Not enough stock' unless @item.stock >= @quantity && @item.stock.positive?
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def subtotal
    @item.price * @quantity
  end
end
