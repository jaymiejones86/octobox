# frozen_string_literal: true
Rails.application.routes.draw do
  root to: 'notifications#index'

  get :login,  to: 'sessions#new'
  get :logout, to: 'sessions#destroy'

  scope :auth do
    match '/:provider/callback', to: 'sessions#create',  via: [:get, :post]
    match :failure,              to: 'sessions#failure', via: [:get, :post]
  end

  resources :notifications, only: [] do
    collection do
      post :archive_selected
      post :sync
    end

    member do
      get :star
    end
  end
end
