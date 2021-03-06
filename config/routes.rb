Rails.application.routes.draw do

  resources :maneges
  get 'designpages/index'
  get 'designpages/show'
  resources :talks
  resources :mails
  resources :friends
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get 'youtubes/index'
  get 'youtubes/search' => 'youtubes#search'

  post '/callback' => 'linebots#callback'

  resources :twitters, only: [:index, :new, :create]
  
  resources :blogs
end
