Rails.application.routes.draw do
  # config/routes.rb
  # ...
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :healthcheck, only: [:index]
  resources :vendors, only: [:index, :create]
  get '/vendors/:name', to: 'vendors#show'
  patch '/vendors', to: 'vendors#update'
  delete '/vendors', to: 'vendors#destroy'
end
