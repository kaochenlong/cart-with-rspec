Rails.application.routes.draw do
  resources :products do
    member do
      post :add_to_cart
    end
  end

  resource :cart, only: [:show, :destroy]
end
