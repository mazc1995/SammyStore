require 'swagger_helper'

RSpec.describe 'Carts API', type: :request, swagger: true do
  let(:cart) { create(:cart) }
  let(:id) { cart.id }

  path '/carts/{id}' do
    parameter name: :id, in: :path, type: :string, description: 'ID of the cart'

    get 'Retrieves a cart' do
      tags 'Carts'
      produces 'application/json'

      response '200', 'cart found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 total: { type: :float }
               },
               required: %w[id total created_at updated_at]
        run_test! do
          expect(JSON.parse(response.body)['id']).to eq(cart.id)
          expect(response).to have_http_status(:ok)
        end
      end

      response '404', 'cart not found' do
        let(:id) { 'invalid' }
        run_test! do
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end
end
