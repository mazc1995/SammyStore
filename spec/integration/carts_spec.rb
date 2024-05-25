require 'swagger_helper'

RSpec.describe 'Carts API', type: :request, swagger: true do
  path '/carts/{id}' do
    parameter name: :id, in: :path, type: :string, description: 'ID of the cart'

    get 'Retrieves a cart' do
      tags 'Carts'
      produces 'application/json'

      response '200', 'cart found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 total: { type: :number }
               },
               required: %w[id total]

        let(:id) { create(:cart).id }

        run_test! do
          expect(JSON.parse(response.body)['id']).to eq(id)
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
