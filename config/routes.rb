Rails.application.routes.draw do
  root "products#index"
  devise_for :users

  # back stage
  namespace :admin do
    resources :products do 
    end
    resources :coupons do 
    end
  end

  # front stage
  resources :products, only: [:index, :show] do 
  end
  
  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
      delete :remove, path:'remove/:id'
    end
  end
end
