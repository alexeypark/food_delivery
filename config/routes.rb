Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'places#index'

  resources :line_items, only: [:create, :destroy]
  resources :carts, only: [:destroy]
  resources :places, only: [:index, :show]
  resources :orders, only: [:create, :index]

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}, path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    authenticated :user do
      root :to => 'admin/dashboard#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'users/sessions#new', as: :unauthenticated_root
    end
  end

end
