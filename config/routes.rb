# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :articles do
    resources :comments, module: :articles
    member do
      delete :delete_attachment
    end
  end

  resources :events do
    resources :comments, module: :events
  end
  authenticated :user, ->(user) { user.has_role? :admin } do
    get '/users', to: 'users#index'
    delete 'users/:id', to: 'users#destroy', as: :admin_destroy_user
  end
end
