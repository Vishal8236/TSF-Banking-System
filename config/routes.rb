Rails.application.routes.draw do
  root 'home#index'
  resources :banking_systems
  get 'make_transaction', to: 'banking_systems#make_transaction'
  post 'do_transaction', to: 'banking_systems#do_transaction'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
