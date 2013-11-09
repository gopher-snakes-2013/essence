Essence::Application.routes.draw do

  root to: "topics#index"

  resources :topics, only: [:index, :new, :create]
  resources :sources, only: [:index, :show]

end
