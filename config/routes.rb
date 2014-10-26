Rails.application.routes.draw do
  root "rants#index"
  post "/" => "rants#destroy"
  get "/home" => "homepage#show", as: :homepage
  get "/signin" => "sessions#new", as: :signin
  get "sign_out" => "sessions#delete", as: :signout
  post "signin" => "sessions#create"

  resources :users do
    resources :rants, only: [:create, :show]
    resources :interesting_ranters, only: [:destroy, :index]
    resources :favorite_rants
  end

  resources :rants , :only => :destroy do
    resources :comments
  end
  get "/rants" => "search#index", as: :rants

  get "/search" => "search#new", as: :search

  post "/interesting_ranters/:id" => "interesting_ranters#create"
  delete "/interesting_ranters/:id" => "interesting_ranters#destroy"

end