Rails.application.routes.draw do
  resources :opinions
  devise_for :users, controllers: { registrations: 'registrations' } 
  root 'opinions#index'
end
