Essence::Application.routes.draw do

  root to: "topics#index"

  resources :topics, only: [:index]

end
