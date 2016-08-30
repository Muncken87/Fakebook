Rails.application.routes.draw do
  devise_for :users
  resources :uploads
  resources :users
  resources :walls
  resources :posts do
    resources :comments
  end
  root 'walls#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
