Rails.application.routes.draw do
  resources :course_enrollments
  resources :courses
  root "schools#index"

  resources :schools, only: [:index] do
    namespace :students do
      get '/login', to: 'sessions#new'
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
    end

    resources :students, only: [:show] do
      resources :terms, only: [:index, :show] do
        resources :term_accesses, only: [:new, :create]
      end
    end
  end
end
