require 'swagger_helper'

RSpec.describe 'CartItems API', type: :request, swagger: true do
  path '/cart_items' do
    post 'Creates a cart_item' do
      tags 'CartItems'
      consumes 'application/json'
      parameter name: :cart_item, in: :body, schema: {
        type: :object,
        properties: {
          cart_id: { type: :integer },
          item_id: { type: :integer },
          quantity: { type: :integer }
        },
        required: %w[cart_id item_id quantity]
      }

      response '201', 'cart_item created' do
        let(:cart) { create(:cart) }
        let(:item) { create(:item) }
        let(:cart_item) { { cart_id: cart.id, item_id: item.id, quantity: 1 } }

        run_test! do
          expect(JSON.parse(response.body)['quantity']).to eq(1)
        end
      end

      response '422', 'invalid request' do
        let(:cart_item) { { cart_id: nil, item_id: nil, quantity: 1 } }

        run_test!
      end
    end
  end

  path '/cart_items/{id}' do
    parameter name: :id, in: :path, type: :integer, description: 'ID of the cart_item'

    put 'Updates a cart_item' do
      tags 'CartItems'
      consumes 'application/json'
      parameter name: :cart_item, in: :body, schema: {
        type: :object,
        properties: {
          quantity: { type: :integer }
        },
        required: ['quantity']
      }

      response '204', 'cart_item updated' do
        let(:cart) { create(:cart) }
        let(:item) { create(:item) }
        let!(:cart_item) { create(:cart_item, cart: cart, item: item) }
        let(:id) { cart_item.id }
        let(:cart_item_params) { { quantity: 2 } }

        run_test! do
          expect(cart_item.reload.quantity).to eq(2)
        end
      end

      response '404', 'cart_item not found' do
        let(:id) { 'invalid' }
        let(:cart_item_params) { { quantity: 2 } }

        run_test!
      end
    end

    delete 'Deletes a cart_item' do
      tags 'CartItems'
      produces 'application/json'

      response '204', 'cart_item deleted' do
        let(:cart) { create(:cart) }
        let(:item) { create(:item) }
        let!(:cart_item) { create(:cart_item, cart: cart, item: item) }
        let(:id) { cart_item.id }

        run_test!
      end

      response '404', 'cart_item not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
