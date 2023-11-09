Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/pform'
  # config/routes.rb
  root 'posts#index'

  devise_for :users

  resources :posts do
    resources :comments
  end

  resource :profile, only: [:show, :edit, :update]

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

end
