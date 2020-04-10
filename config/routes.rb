Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :auctions

  root 'auctions#index'

  resources :users, only: [:index, :show]
  resources :bids, only: [:index, :show, :new, :create]

  # get 'show', to: 'users#show'
  # get 'index', to: 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
