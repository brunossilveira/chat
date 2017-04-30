Rails.application.routes.draw do
  resources :sessions
  resources :rooms

  root to: 'rooms#index'
end
