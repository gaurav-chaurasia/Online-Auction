Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  
  resources :searches
  resources :auctions
  resources :auctions do
    member do
      patch 'claim'
    end
  end

  root 'auctions#index'
  # patch '/auctions/:id/claim', to: 'auctions#claim'

  resources :users, only: [:index, :show]
  get 'claimed', to: 'users#claimed'
  get 'sold', to: 'users#sold'

  resources :bids, only: [:index, :new, :create]
  get 'cart', to: 'bids#cart'
  
  # get 'show', to: 'users#show'
  # get 'index', to: 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
