Rails.application.routes.draw do
  root "movies#index"

  get "/signup" => "users#new"
  resources :users

  resource :session

  resources :movies do
    resources :reviews
  end
end