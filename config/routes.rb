Rails.application.routes.draw do
  root to: 'homepage#index'

  resources :registrations
  resources :sessions, except: :create

  post "sign_in" => "sessions#create"
end
