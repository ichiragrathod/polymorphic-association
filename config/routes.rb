# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  resources :articles do
    resources :comments, module: :articles
  end
  resources :events do
    resources :comments, module: :events
  end
end
