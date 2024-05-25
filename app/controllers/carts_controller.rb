class CartsController < ApplicationController
  def show
    @cart = find_cart
    raise StandardError, 'Cant find cart' unless @cart

    render json: @cart, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  private

  def find_cart
    Cart.find_by(id: params[:id])
  end
end
