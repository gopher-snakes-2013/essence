Essence::Application.routes.draw do

  root to: "topics#index"

  resources :sources, only: [:index, :show, :create]
  resources :topics, only: [:index, :new, :create, :show, :destroy]
  resources :snippets, only: [:create, :destroy]

  get '/open' => 'sources#create'
  get '/proxy' => 'sources#proxy', as: :proxy

end
