Rails.application.routes.draw do
  root to:"tweets#index"
  devise_for :users
  resources :users do
    resource :relations, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    # viewを付けるので、get :follows, on: :memberを書く
    
  end
  resources :tweets do
    resource :iines, only: [:create, :destroy]
    resource :comments, only: [:create]
  end
end
