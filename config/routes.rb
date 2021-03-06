Rails.application.routes.draw do
  devise_for :users do
    resources :bookings, only: [:index]
  end

  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :ties, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create, :destroy]
  end

  # verb 'path', to: 'controller#action'

  get "map", to: "ties#map"
end
