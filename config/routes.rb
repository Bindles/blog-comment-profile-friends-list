#routes
Rails.application.routes.draw do
  # config/routes.rb
  root 'posts#index'
  devise_for :users

  resources :posts do
    resources :comments
  end
  resource :profile
  resources :friends, only: [:index, :create, :destroy]

  get '/profile/:id', to: 'profiles#show', as: 'profile_by_id'
  get '/profile/:username', to: 'profiles#show', as: 'profile_by_username'

  get "up" => "rails/health#show", as: :rails_health_check
end
