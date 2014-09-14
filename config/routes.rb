Rails.application.routes.draw do
  root "rants#new"
  get "/home" => "homepage#show", as: :homepage
  get "/signin" => "sessions#new", as: :signin
  get "sign_out" => "sessions#delete", as: :signout
  post "signin" => "sessions#create"

  resources :users do
    resources :rants
  end
end
