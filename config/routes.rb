Rails.application.routes.draw do
  root 'index#index'
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
