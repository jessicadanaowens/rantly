Rails.application.routes.draw do
  root "rants#new"
  post "/" => "rants#destroy"
  get "/home" => "homepage#show", as: :homepage
  get "/signin" => "sessions#new", as: :signin
  get "sign_out" => "sessions#delete", as: :signout
  post "signin" => "sessions#create"

  resources :users do
    resources :rants, only: [:create]
    resources :interestingranters, only: [:create, :destroy, :index]
  end

  resources :rants , :only => :destroy


end