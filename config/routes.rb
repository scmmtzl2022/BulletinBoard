Rails.application.routes.draw do
  root "sessions#welcome"
  # for posts
  resources :posts do
    collection do
      post 'posts/confirm', to: 'posts#confirm', as: 'confirm'
      get :confirm, to: "posts#new"
      post :confirm_create
      get :upload_csv
      post :import_csv
      get :download
      
    end
    member do
      post 'posts/confirm_update', to: "posts#confirm_update", as: 'confirm_update'
      get :confirm_update, to: "posts#edit"
      post :update_post
    end
   
  end
  # for users
  resources :users do
    collection do
      post :confirm_create
      get :confirm_create, to: "users#new"
      get :search_user
    end
    member do
      get :profile, to: "users#profile"
      get :edit_profile, to: "users#edit_profile"
      post :update_profile
      get :update_profile, to: "users#edit_profile"
      get :change_password
      post :update_password
    end     
  end
  # for login
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/sign_up'
  get 'sessions/welcome'

  get 'login', to: 'sessions#new'
  get 'sign_up', to: 'sessions#sign_up'
 
  get 'logout', to: 'sessions#logout'
  post 'login', to: 'sessions#create'
  post 'sign_up', to: 'users#sign_up'
  post 'sign_up', to: 'sessions#sign_up'
  
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  
 
  # for password reset
  get 'password', to: 'passwords#edit', as: 'edit_password'
  post 'password', to: 'passwords#update'

  get 'password/reset', to: 'passwords#new'
  post 'password/reset', to: 'passwords#create'
  get 'password/reset/edit', to: 'passwords#editReset'
  patch 'password/reset/edit', to: 'passwords#updateReset'
end
