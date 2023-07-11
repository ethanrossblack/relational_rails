Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/elections", to: "elections#index"
  get "/elections/new", to: "elections#new"
  get "/elections/:id", to: "elections#show"
  post "/elections", to: "elections#create"
  get "/elections/:id/edit", to: "elections#edit"
  patch "/elections/:id", to: "elections#update"
  
  get "/candidates", to: "candidates#index"
  get "/candidates/:id", to: "candidates#show"
  
  get "/elections/:id/candidates", to: "election_candidates#index"
  get "/elections/:id/candidates/new", to: "election_candidates#new"
  
end
