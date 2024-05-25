class CartsController < ApplicationController
  before_action :find_cart, only: %i[show clear]

  def show
    render json: @cart, status: :ok
  end

  def clear
    @cart.cart_items.destroy_all
    render json: @cart, status: :no_content
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end
end
