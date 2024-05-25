class CartsController < ApplicationController
  def show
    @cart = find_cart
    render json: @cart, include: ['cart_items']
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  private

  def find_cart
    Cart.find(params[:id])
  end
end
