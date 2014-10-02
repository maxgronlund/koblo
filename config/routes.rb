Rails.application.routes.draw do
  #get 'home/index'

  root to: 'home#index'
  devise_for :users
  resources :users do
    resources :remixes
  end
  
  resources :songs

end
