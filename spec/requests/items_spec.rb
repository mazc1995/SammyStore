require 'rails_helper'

RSpec.describe 'Items', type: :request do
  describe 'GET /items' do
    before do
      create_list(:item, 5)
    end

    it 'returns all items' do
      get '/items'
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe 'GET /items/:id' do
    let(:item) { create(:item) }
    context 'when request is valid' do
      it 'returns an item' do
        get "/items/#{item.id}"
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when request is invalid' do
      it 'returns an item' do
        get '/items/100'
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'POST /items' do
    let(:valid_attributes) do
      { name: 'New Item', item_type: 'Product', stock: 10, price: 20.0, thumbnail: 'new.png',
        description: 'New description' }
    end

    let(:invalid_attributes) do
      { name: '', item_type: 'Product', stock: 10, price: 20.0, thumbnail: 'new.png', description: 'New description' }
    end

    context 'when the request is valid' do
      it 'creates a new item' do
        expect do
          post '/items', params: { item: valid_attributes }
        end.to change(Item, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      it 'returns a validation failure message' do
        post '/items', params: { item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /items/:id' do
    let(:item) { create(:item) }

    let(:valid_attributes) do
      { name: 'New Item', item_type: 'Product', stock: 10, price: 20.0, thumbnail: 'new.png',
        description: 'New description' }
    end

    let(:invalid_attributes) do
      { name: '', item_type: 'Product', stock: 10, price: 20.0, thumbnail: 'new.png', description: 'New description' }
    end

    context 'when the request is valid' do
      it 'updates one item' do
        put "/items/#{item.id}", params: { item: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the request is invalid' do
      it 'updates one item' do
        put "/items/#{item.id}", params: { item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /items/:id' do
    let(:item) { create(:item) }

    context 'when the request is valid' do
      it 'deletes one item' do
        delete "/items/#{item.id}"
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the request is invalid' do
      it 'deletes one item' do
        delete '/items/100'
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
