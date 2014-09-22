Rails.application.routes.draw do
  root to: 'songs#index'
  devise_for :users
  resources :users
  
  resources :songs
end
