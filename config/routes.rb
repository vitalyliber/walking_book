Rails.application.routes.draw do
  get 'image_uploader/create'

  devise_for :users
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root 'homes#index'
  post "image_uploader", to: "image_uploader#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '*path', to: 'homes#index'
end
