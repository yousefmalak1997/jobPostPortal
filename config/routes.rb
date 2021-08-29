Rails.application.routes.draw do
  resources :jobs_applications
  devise_for :users
  resources :jobs
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
