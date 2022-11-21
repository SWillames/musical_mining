Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :records
      resources :artists
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  post "refresh", to: "refresh#create"
  post "signin", to: "signin#create"
  post "signup", to: "signup#create"
  delete "signin", to: "signin#destroy"
end
