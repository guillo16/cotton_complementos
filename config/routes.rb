Rails.application.routes.draw do
  get 'divisions/show'
  devise_for :users
  root to: 'pages#home'
  resources :divisions, only: :show
  resources :categories, only: :show
  resources :products do
    resources :variants, only: [:new, :create]
  end
  resources :line_items
  resources :carts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
