# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products do
    member do
      post :add_to_cart
    end
  end

  resource :cart, only: %i[show destroy]
end
