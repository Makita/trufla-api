Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :departments, only: [:index]
  resources :promo_codes, only: [:index]
  get 'products/:start/:end', to: "products#index"
end