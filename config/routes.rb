Essence::Application.routes.draw do

  root to: "topics#index"

  resources :sources, only: [:index, :show]
  resources :topics, only: [:index, :new, :create, :destroy]
  resources :snippets, only: [:index, :new, :create]

end
