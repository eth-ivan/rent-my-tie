Rails.application.routes.draw do

  devise_for :users

  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :ties, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:create, :destroy]
  end

  resources :bookings, only: [:destroy]

  # verb 'path', to: 'controller#action'
  # resources :bookings, only: [:show]

  get "my_bookings", to: "bookings#my_bookings"

  get "map", to: "ties#map"
end
