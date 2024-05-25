class CartItemsController < ApplicationController
  def create
    @item = find_item
    @cart = find_cart
    @desired_quantity = params['quantity'].to_i
    validate_stock!
    validate_quantity!
    @cart_item = CartItem.create(cart: @cart, item: @item, quantity: @desired_quantity)
    update_cart_item
    render json: @cart_item, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def update
    @cart_item = find_cart_item
    @item = @cart_item.item
    @desired_quantity = params['quantity'].to_i
    validate_stock!
    validate_quantity!
    update_cart_item
    render json: @cart_item, status: :no_content
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  def destroy
    @cart_item = find_cart_item
    @cart_item.destroy
    render json: @cart_item, status: :no_content
  rescue StandardError => e
    render json: { error: e.message }, status: :no_content
  end

  private

  def find_item
    Item.find(params['item_id'])
  end

  def find_cart
    Cart.find(params['cart_id'])
  end

  def find_cart_item
    CartItem.find(params['id'])
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
