# frozen_string_literal: true

Rails.application.routes.draw do
  resources :notifications
  get '/signin', to: 'panel/user_sessions#new'

  namespace :panel do
    resources :tickets
    get 'integrations/index'
    get '/', to: 'pages#index'
    get '/documentation', to: 'pages#documentation', as: :documentation

    resource :user_sessions, only: %i[create destroy], as: :sessions
    resources :campaigns do
      scope module: :campaigns do
        resources :comments
      end
    end

    get '/settings', to: 'settings#show', as: :show_settings
    get '/settings/edit', to: 'settings#edit', as: :edit_settings
    patch '/settings', to: 'settings#update', as: :update_settings
  end

  # scope :admin do
  # end

  namespace :api do
    resources :campaigns do
      collection do
        get :generate_token
      end
    end
    get '/settings/token', to: 'settings#token', as: :personal_api_token
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'

  get '/about', to: 'pages#about', as: :about
  get '/pricing', to: 'pages#pricing', as: :pricing
  get '/contacts', to: 'pages#contacts', as: :contacts
  get '/features', to: 'pages#features', as: :features
  get '/beta', to: 'pages#beta', as: :beta
  get '/custom', to: 'pages#custom', as: :custom
  get '/cookies', to: 'pages#cookies', as: :cookies
end
