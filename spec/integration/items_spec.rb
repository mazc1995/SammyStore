require 'swagger_helper'

RSpec.describe 'Items API', type: :request do
  path '/items' do
    get 'Retrieves all items' do
      tags 'Items'
      produces 'application/json'

      response '200', 'items found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   item_type: { type: :string },
                   price: { type: :number },
                   stock: { type: :integer },
                   thumbnail: { type: :string },
                   description: { type: :string }
                 },
                 required: %w[id name item_type price stock thumbnail description]
               }

        before do
          create_list(:item, 5)
        end

        run_test! do
          expect(JSON.parse(response.body).size).to eq(5)
        end
      end
    end

    post 'Creates an item' do
      tags 'Items'
      consumes 'application/json'
      parameter name: :item, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          item_type: { type: :string },
          price: { type: :number },
          stock: { type: :integer },
          thumbnail: { type: :string },
          description: { type: :string }
        },
        required: %w[name item_type price stock thumbnail description]
      }

      response '201', 'item created' do
        let(:item) do
          { name: 'New Item', item_type: 'Product', stock: 10, price: 20.0, thumbnail: 'new.png',
            description: 'New description' }
        end

        run_test! do
          expect do
            post '/items', params: { item: item }
          end.to change(Item, :count).by(1)
        end
      end

      response '422', 'invalid request' do
        let(:item) do
          { name: '', item_type: 'Product', stock: 10, price: 20.0, thumbnail: 'new.png',
            description: 'New description' }
        end

        run_test! do
          post '/items', params: { item: item }
        end
      end
    end
  end

  path '/items/{id}' do
    parameter name: :id, in: :path, type: :string, description: 'ID of the item'

    get 'Retrieves an item' do
      tags 'Items'
      produces 'application/json'
      response '200', 'item found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 item_type: { type: :string },
                 price: { type: :number },
                 stock: { type: :integer },
                 thumbnail: { type: :string },
                 description: { type: :string }
               },
               required: %w[id name item_type price stock thumbnail description]

        let(:id) { create(:item).id }

        run_test!
      end

      response '404', 'item not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates an item' do
      tags 'Items'
      consumes 'application/json'
      parameter name: :item, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          item_type: { type: :string },
          price: { type: :number },
          stock: { type: :integer },
          thumbnail: { type: :string },
          description: { type: :string }
        },
        required: %w[name item_type price stock thumbnail description]
      }

      response '200', 'item updated' do
        let(:id) { create(:item).id }
        let(:item) do
          { name: 'Updated Item', item_type: 'Product', stock: 10, price: 20.0, thumbnail: 'updated.png',
            description: 'Updated description' }
        end

        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { create(:item).id }
        let(:item) do
          { name: '', item_type: 'Product', stock: 10, price: 20.0, thumbnail: 'updated.png',
            description: 'Updated description' }
        end

        run_test!
      end
    end

    delete 'Deletes an item' do
      tags 'Items'
      produces 'application/json'
      response '204', 'item deleted' do
        let(:id) { create(:item).id }
        run_test!
      end

      response '404', 'item not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
