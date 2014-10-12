Rails.application.routes.draw do


  
  get "admin"         => "admin#index",       :as => :admin_index

  #get 'home/index'

  root to: 'home#index'
  devise_for :users
  resources :users do
    resources :remixes
  end
  
  resources :songs
  
  namespace :admin do
    #resources :admin, only: [:index]
    resources :news
  end

end
