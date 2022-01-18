Rails.application.routes.draw do
  get '/signin', to: 'panel/session#new'

  namespace :panel do
  end

  namespace :admin do
  end

  namespace :api do
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
