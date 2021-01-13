Rails.application.routes.draw do
  resources :genres
  root "movies#index"
  
  get "/signup" => "users#new"
  resources :users
  
  get "/signin" => "sessions#new"
  resource :session
  
  resources :movies do
    resources :reviews
    resources :favorites
  end
end