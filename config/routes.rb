# frozen_string_literal: true

Rails.application.routes.draw do
  get '/signin', to: 'panel/user_sessions#new'

  namespace :panel do
    get 'integrations/index'
    get '/', to: 'pages#index'
    get '/documentation', to: 'pages#documentation', as: :documentation
    get '/settings', to: 'pages#settings', as: :settings

    resource :user_sessions, only: %i[create destroy], as: :sessions
    resources :campaigns
  end

  # scope :admin do
  # end

  namespace :api do
    resources :campaigns do
      collection do
        get :generate_token
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'

  get '/about', to: 'pages#about'
  get '/pricing', to: 'pages#pricing'
end
