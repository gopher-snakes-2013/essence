Essence::Application.routes.draw do

  root to: "topics#index"

  resources :topics, only: [:index, :new, :create, :destroy]
  resources :sources, only: [:index, :show]

end
