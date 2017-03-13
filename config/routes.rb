Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}

  devise_scope :user do
    get "login", to: "devise/sessions#new"
    authenticated :user do
      root :to => 'admin/dashboard#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'users/sessions#new', as: :unauthenticated_root
    end
  end

  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
