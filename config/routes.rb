Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :ties
  # verb 'path', to: 'controller#action'

  get "ties/:id", to: "ties#show", as: :tie
end
