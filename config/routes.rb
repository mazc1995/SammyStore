# == Route Map
#

Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  resources :items

  # Cart
  get '/carts/:id', controller: :carts, action: :show

  # CartItem
  post '/cart_items', controller: :cart_items, action: :create
  put '/cart_items/:id', controller: :cart_items, action: :update
  delete '/cart_items/:id', controller: :cart_items, action: :destroy
end
