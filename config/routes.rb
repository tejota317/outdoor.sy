Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "customer#index"

  get "/customer", to: "customer#index"
  post "/list", to: "customer#list"
end
