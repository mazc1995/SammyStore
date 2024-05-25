class CartItemsController < ApplicationController
  before_action :find_item, :find_cart, only: %i[create]
  before_action :find_cart_item, only: %i[update destroy]
  before_action :set_data, only: %i[create update]

  def create
    raise StandardError, :not_found unless @item && @cart
    raise StandardError, :unprocessable_entity unless validate_stock! && validate_quantity!

    @cart_item = CartItem.create(cart: @cart, item: @item, quantity: @quantity)
    update_cart_item
    render json: @cart_item, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: e.message.to_sym
  end

  def update
    raise StandardError, :not_found unless @cart_item

    @item = @cart_item.item
    raise StandardError, :unprocessable_entity unless validate_stock! && validate_quantity!

    update_cart_item
    render json: @cart_item, status: :no_content
  rescue StandardError => e
    render json: { error: e.message }, status: e.message.to_sym
  end

  def destroy
    raise StandardError, :not_found unless @cart_item

    @cart_item.destroy
    render json: @cart_item, status: :no_content
  rescue StandardError => e
    render json: { error: e.message }, status: e.message.to_sym
  end

  private

  def set_data
    @quantity = params['quantity'].to_i
  end

  def find_item
    @item = Item.find_by(id: params['item_id'])
  end

  def find_cart
    @cart = Cart.find_by(id: params['cart_id'])
  end

  def find_cart_item
    @cart_item = CartItem.find_by(id: params['id'])
  end

  def validate_stock!
    @item.stock >= @quantity && @item.stock.positive?
  end

  def validate_quantity!
    @quantity >= 0
  end

  def update_cart_item
    if @quantity.zero?
      @cart_item.destroy
    else
      subtotal = @item.price * @quantity
      @cart_item.update(quantity: @quantity, subtotal: subtotal)
    end
  end

  def update_cart
    total = 0
    @cart.cart_items.each do |item|
      total += item.subtotal
    end
    @cart.update(total: total)
  end
end
