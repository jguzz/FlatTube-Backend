Rails.application.routes.draw do
  resources :likes
  resources :tags
  resources :comments
  resources :users
  resources :videos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
