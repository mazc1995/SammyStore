# == Route Map
#

Rails.application.routes.draw do
  resources :items
  get 'cart_items/create'
  get 'cart_items/update'
  get 'cart/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/api/cart', controller: :cart, action: :show
  post '/api/cart/items', controller: :cart_items, action: :add_cart_item
  delete '/api/cart_item', controller: :cart_items, action: :destroy_cart_item
end
