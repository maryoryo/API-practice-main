Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'youtubes/index'

  post '/callback' => 'linebots#callback'

  resources :twitters, only: [:index, :new, :create]
  
  resources :blogs
end
