Rails.application.routes.draw do
  namespace :admin do
    resources :products do 
    end

    resources :coupons do 
    end
  end

  resources :products, only: [:index, :show] do 
  end
end
