Rails.application.routes.draw do
  root "rants#index"
  post "/" => "rants#destroy"
  get "/home" => "homepage#show", as: :homepage
  get "/signin" => "sessions#new", as: :signin
  get "sign_out" => "sessions#delete", as: :signout
  post "signin" => "sessions#create"

  resources :users do
    resources :rants, only: [:create, :show]
    resources :interesting_ranters, only: [:create, :destroy, :index]
    resources :favorite_rants
  end

  resources :rants , :only => :destroy
  get "/rants" => "search#index", as: :rants

  get "/search" => "search#new", as: :search


end