Rails.application.routes.draw do
  get 'breweries/index'

  get 'breweries/new'

  get 'breweries/create'

  get 'breweries/show'

  get 'breweries/edit'

  get 'breweries/update'

  get 'breweries/destroy'

  # get 'beers/index'
  # get 'beers/new'
  # get 'beers/create'
  # get 'beers/show'
  # get 'beers/edit'
  # get 'beers/update'
  # get 'beers/destroy'

  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  # get 'users/new'
  # get 'users/create'
  # get 'users/show'

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :beers

end
