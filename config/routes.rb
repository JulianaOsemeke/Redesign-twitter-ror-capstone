Rails.application.routes.draw do
  resources :opinions
  devise_for :users, controllers: { registrations: 'registrations' } 
  resources :followings, only: [:create, :destroy]
  root 'opinions#index'
  
end
