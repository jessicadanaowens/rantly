Rails.application.routes.draw do
  root "rants#index"
  post "/" => "rants#destroy"
  get "/home" => "homepage#show", as: :homepage
  get "/signin" => "sessions#new", as: :signin
  get "sign_out" => "sessions#delete", as: :signout
  post "signin" => "sessions#create"

  resources :users do
    resources :rants, only: [:show]
    resources :interesting_ranters, only: [:index]
    resources :favorite_rants, only: [:index]
  end

  resources :rants , :only => :destroy do
    resources :comments
  end
  get "/rants" => "search#index", as: :rants

  get "/search" => "search#new", as: :search

  post "/interesting_ranters/:id" => "interesting_ranters#create"
  delete "/interesting_ranters/:id" => "interesting_ranters#destroy"

  post "/favorite_rants/:id" => "favorite_rants#create", as: :add_interesting_ranter
  delete "/favorite_rants/:id" => "favorite_rants#destroy", as: :delete_interesting_ranter

  post "/rants" => "rants#create", as: :new_rant

  get "/confirm_email/:confirmation_token" => "users#confirm", as: :email_confirmation

end