Rails.application.routes.draw do
  resources :delivery_boys
  resources :localities
  resources :time_slots
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  resources :order_items
  resources :food_items
  resources :orders do
    collection do
      get :place
    end
  end
  resources :addresses
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :cart, only: [:show]
  root to: 'homes#index'
end
