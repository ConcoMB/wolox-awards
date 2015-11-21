RailsBootstrap::Application.routes.draw do

  devise_for :backoffice_administrators
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # root to: 'application#index'

  require 'sidekiq/web'
  mount Sidekiq::Web, at: 'sidekiq'
  mount PgHero::Engine, at: 'pghero'

  root to: 'home#show'
  get '/results', to: 'home#results', as: 'results'

  resources :categories, only: [:show, :index] do
    member do
      resources :votes, only: [:create]
    end
  end

end
