Rails.application.routes.draw do
  devise_for :users
  root 'listings#index'
  resources :listings do
    resources :orders
  end
  get 'pages/about'
  get 'pages/contact'
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"
end
