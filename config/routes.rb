Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'payments/new'
  devise_for :users
  root to: 'pages#home'
  post 'procesar-pago', to: "payments#create"
  resources :divisions, only: :show
  resources :categories, only: :show
  resources :products do
    resources :variants, only: [:new, :create]
  end
  resources :line_items
  resources :carts

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: :new
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
