Rails.application.routes.draw do

  get 'charges/index'
  get 'charges/show'
  get 'charges/create'
  get 'payments/new'
  get 'products/search', to: 'products#search'
  devise_for :users
  root to: 'pages#home'
  get 'pages/search', to: 'pages#search'

  post 'procesar-pago', to: "payments#create"
  resources :divisions, only: :show
  resources :categories
  resources :products do
    resources :variants, only: [:new, :create]
  end
  resources :line_items
  resources :carts

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: :new
  end
  resources :variants, only: [:show, :edit, :update]
  resources :users, only: [:index, :show]

  resources :charges, only: [:index, :show, :create, :destroy]
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
