Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  # Defines the root path route ("/")
  root "blog_posts#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :blog_posts do
    collection do
      get 'my_blogs'
    end
  end

  get 'feedback', to: 'feedback#new'
  post 'feedback', to: 'feedback#create'

  # API Routes
  namespace :api do
    namespace :v1 do
      resources :blog_posts, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
