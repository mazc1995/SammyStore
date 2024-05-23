class CartController < ApplicationController
  def show
    @cart = Cart.find(params['cart_id'])
    render json: @cart, include: ['cart_items']
  end
end
