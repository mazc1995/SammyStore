require 'rails_helper'

RSpec.describe 'CartItems API', type: :request do
  let!(:cart) { create(:cart) }
  let!(:item) { create(:item) }
  let(:cart_item) { create(:cart_item, cart: cart, item: item) }
  let(:cart_id) { cart.id }
  let(:item_id) { item.id }
  let(:cart_item_id) { cart_item.id }

  describe 'POST /cart_items' do
    let(:valid_attributes) { { cart_id: cart_id, item_id: item_id, quantity: 1 } }

    context 'when the request is valid' do
      before { post '/cart_items', params: valid_attributes }

      it 'creates a cart_item' do
        expect(JSON.parse(response.body)['quantity']).to eq(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      before { post '/cart_items', params: { cart_id: nil, item_id: item_id, quantity: 1 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /cart_items/:id' do
    let(:valid_attributes) { { quantity: 2 } }

    context 'when the record exists' do
      before { put "/cart_items/#{cart_item_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response).to have_http_status(:no_content)
        expect(cart_item.reload.quantity).to eq(2)
      end
    end

    context 'when the record does not exist' do
      let(:cart_item_id) { 100 }

      before { put "/cart_items/#{cart_item_id}", params: valid_attributes }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'DELETE /cart_items/:id' do
    before { delete "/cart_items/#{cart_item_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
