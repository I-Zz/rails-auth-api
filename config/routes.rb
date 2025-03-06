Rails.application.routes.draw do
  # devise_for :users

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  namespace :users do
    get "me", to: "users#me"
    patch "update", to: "users#update"
    patch "update_password", to: "users#update_password"
    delete "delete", to: "users#destroy"
  end

  # namespace :users do
  #   resource :profile, only: [ :show, :update, :destroy ], controller: "users" do
  #     patch :update_password, on: :collection
  #   end
  # end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
