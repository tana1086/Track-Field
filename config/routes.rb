Rails.application.routes.draw do
  get "users/show"
  get "users/likes"
  devise_for :users

  resources :users do
    member do
      get :liked_posts
    end
  end

  resources :posts do
    resource :like, only: [ :create, :destroy ]
  end

  resources :profiles, only: [ :new, :create, :show, :edit, :update ] do
    collection do
      get :fetch_data
    end
  end
  resources :competition_results
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "static_pages#top"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
