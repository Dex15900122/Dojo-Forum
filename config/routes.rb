Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'articles#index'
  resources :articles do
    resources :comments, only: [:create, :destroy]
    member do
      post :favorite
      post :unfavorite
    end
  end
  resources :categories
  
  namespace :admin do
    root "categories#index"
    resources :users
    resources :categories 
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get :mypost
      get :mycomment
      get :mycollect
    end
  end




end
