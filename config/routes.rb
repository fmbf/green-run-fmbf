Rails.application.routes.draw do

  get 'searches/index'

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :breweries

  resources :beers do
    resources :comments, only: [:create, :update, :destroy]
  end

  resources :comments, only: [:destroy]
end
