Rails.application.routes.draw do


  resources :messages
  resources :user_convos
  resources :conversations
  resources :likes
  resources :comments
  resources :posts
  resources :users
  resources :quotes
  resources :philosophies
  resources :bios
  resources :people

  get "/current_user", to: "auth#show"
  post "/auth", to: "auth#create"
  get "/search", to: "posts#search"
  
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
