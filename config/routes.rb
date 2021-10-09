Rails.application.routes.draw do
  resources :posts
  root 'index#index'
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
