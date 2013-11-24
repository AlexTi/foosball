Foosball::Application.routes.draw do
  resources :matches
  resources :rankings, only: [:index]
  resources :teams, only: [:show]

  root 'matches#index'
end
