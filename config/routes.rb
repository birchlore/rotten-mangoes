Rails.application.routes.draw do

  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  root to: 'movies#index'

   namespace :admin do
    resources :users
    get '/users/become/:id', to: 'users#become'
  end

end
