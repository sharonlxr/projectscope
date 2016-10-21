Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :projects
  root 'projects#index'
  resources :whitelist
  # get '/whitelist', to: 'whitelist#index'
  # get '/whitelist/index', to: 'whitelist#index'
  # post '/whitelist/add', to: 'whitelist#add'
  # get '/whitelist/new', to: 'whitelist#new'
  # delete '/whitelist/delete/', to: 'whitelist#delete'
  
end
