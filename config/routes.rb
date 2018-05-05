Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  # get 'users/new'
  # get 'users/create'
  # get 'users/show'

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

end
