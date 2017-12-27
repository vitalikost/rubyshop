Rails.application.routes.draw do
  get 'cart/add'

  get 'cart/remove'

  resources :product
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'product#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
