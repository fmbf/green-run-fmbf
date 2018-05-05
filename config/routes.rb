Rails.application.routes.draw do
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
  resource :beers

end
