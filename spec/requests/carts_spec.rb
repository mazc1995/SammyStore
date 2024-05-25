require 'rails_helper'

RSpec.describe 'Carts API', type: :request do
  let!(:cart) { create(:cart) }

  describe 'GET /carts/:id' do
    before { get "/carts/#{cart_id}" }

    context 'when the record exists' do
      let(:cart_id) { cart.id }

      it 'returns the cart' do
        expect(JSON.parse(response.body)['id']).to eq(cart_id)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the record does not exist' do
      let(:cart_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
