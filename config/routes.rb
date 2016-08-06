Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :comments
  resources :walls
  root 'walls#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
