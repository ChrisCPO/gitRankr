require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "sessions#new"
  end

  resource :search, only: [:show]
  resources :groups, only: [:new, :create, :show, :index] do
    resource :membership, only: [:new, :create, :destroy]
    resources :messages, only: [:new, :create, :destroy]
  end

end
