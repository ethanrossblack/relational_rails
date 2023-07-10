Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/elections", to: "elections#index"
  get "/elections/new", to: "elections#new"
  get "/elections/:id", to: "elections#show"
  get "/elections/:id/candidates", to: "elections#candidates_index"
  post "/elections", to: "elections#create"

  get "/candidates", to: "candidates#index"
  get "/candidates/:id", to: "candidates#show"


end
