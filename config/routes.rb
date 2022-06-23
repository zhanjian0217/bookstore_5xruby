# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  devise_scope :user do
    post "users/sign_up", to: "devise/registrations#create"
  end

  # back stage
  namespace :admin do
    resources :products do
    end
    resources :coupons, only: %i[index new create destroy] do
    end
  end

  # front stage
  resources :products, only: %i[index show] do
  end

  resource :cart, only: %i[show destroy] do
    collection do
      post :add, path: 'add/:id'
      delete :remove, path: 'remove/:id'
      post :mycoupon
    end
  end

  resources :coupons, only: %i[index update] do
    collection do
      get :my_coupons
    end
  end

  resources :orders, only: [] do
    collection do
      get :payment
      post :payment_response
    end
  end
end
