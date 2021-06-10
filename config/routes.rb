Rails.application.routes.draw do
  get 'users/home'
  resources :opinions
  devise_for :users, controllers: { registrations: 'registrations' } 
  resources :followings, only: [:create, :destroy]
  root 'users#home'
  get 'users/show'
end
