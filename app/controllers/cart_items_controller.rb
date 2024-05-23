class CartItemsController < ApplicationController
  def add_cart_item
    @item = find_item
    @cart = find_cart
    @desired_quantity = params['desired_quantity'].to_i
    validate_stock!
    validate_quantity!
    @cart_item = find_or_create_cart_item
    update_cart_item
    update_cart
    render json: @cart, include: ['cart_items']
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def destroy_cart_item
    @item = find_item
    @cart = find_cart
    @cart_item = find_or_create_cart_item
    @cart_item&.destroy
    update_cart
    render json: @cart, include: ['cart_items']
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def find_item
    Item.find(params['item_id'])
  end

  def find_cart
    Cart.find(params['cart_id'])
  end

  def find_or_create_cart_item
    CartItem.find_or_create_by(item: @item, cart: @cart)
  end

  def validate_stock!
    raise StandardError, 'Not enough stock' unless @item.stock >= @desired_quantity && @item.stock.positive?
  end

  def validate_quantity!
    raise StandardError, 'Invalid quantity' unless @desired_quantity >= 0
  end

  def update_cart_item
    if @desired_quantity.zero?
      @cart_item.destroy
    else
      subtotal = @item.price * @desired_quantity
      @cart_item.update(quantity: @desired_quantity, subtotal: subtotal)
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
