Essence::Application.routes.draw do

  root to: "topics#index"

  resources :sources, only: [:index, :show, :create]
  resources :topics, only: [:index, :new, :create, :show, :destroy]
  resources :snippets, only: [:create, :update, :destroy]

  get '/open' => 'sources#open_pdf'
  get '/proxy' => 'sources#proxy', as: :proxy
end
