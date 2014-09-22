Rails.application.routes.draw do
  root to: 'songs#index'
  devise_for :users
  resources :users do
    resources :remixes
  end
  
  resources :songs

end
