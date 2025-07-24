Rails.application.routes.draw do

  root "schools#index"

  resources :schools, only: [:index] do
    namespace :students do
      get '/login', to: 'sessions#new'
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
    end

    resources :students, only: [:show]
  end

end
