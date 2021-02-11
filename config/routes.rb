Rails.application.routes.draw do

  get 'products/search', to: 'products#search'
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  get 'pages/search', to: 'pages#search'

  resources :divisions, only: :show
  resources :categories
  resources :products do
    resources :variants, only: [:new, :create]
  end
  resources :line_items
  resources :carts

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: [:new, :create]
  end
  resources :variants, only: [:show, :edit, :update]
  resources :users, only: [:index, :show]

  resources :charges, only: [:index, :show, :create, :destroy]
  resources :payments, only: :index
  resources :shippings, only: [:new, :create]
end
