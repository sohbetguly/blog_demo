Rails.application.routes.draw do
  get "users/profile"
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }
  get "/u/:id", to: "users#profile", as: "user"
  resources :posts
  get "about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
end
