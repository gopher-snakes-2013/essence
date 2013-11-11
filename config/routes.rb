Essence::Application.routes.draw do

  root to: "topics#index"

  resources :sources, only: [:index, :show]
  resources :topics, only: [:index, :new, :create, :show, :destroy]
  resources :snippets, only: [:new, :create, :destroy]

end
