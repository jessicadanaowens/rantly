Rails.application.routes.draw do
  root to: 'homepage#index'

  resources :registrations
end
