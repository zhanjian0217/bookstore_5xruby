Rails.application.routes.draw do
  root "products#index"
  devise_for :users

  # back stage
  namespace :admin do
    resources :products do 
    end
    resources :coupons, only: [:index, :new, :create, :destroy] do 
    end
  end

  # front stage
  resources :products, only: [:index, :show] do 
  end
  
  resource :cart, only: [:show, :destroy] do
    collection do
      post :add, path:'add/:id'
      delete :remove, path:'remove/:id'
      post :mycoupon
    end
  end

  resources :coupons, only: [:index, :update] do
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
