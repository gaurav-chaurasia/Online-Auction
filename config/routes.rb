Rails.application.routes.draw do
  devise_for :users
  resources :auctions

  root 'auctions#index'

  resources :users, only: [:index, :show]

  # get 'show', to: 'users#show'
  # get 'index', to: 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
