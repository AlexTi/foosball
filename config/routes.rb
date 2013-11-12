Foosball::Application.routes.draw do
  resources :matches
  resources :rankings, only: [:index]

  root 'matches#index'
end
