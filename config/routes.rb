Rails.application.routes.draw do
  resources :users, :only => [:show, :update], :path => "u"
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks" }, :skip => [:password]
  
  resources :projects do
    collection do
      post "/metrics_on_date", :to => "projects#metrics_on_date"
    end
  	member do
  		post "/add_owner", :to => "projects#add_owner"
  	end
  end

  root 'projects#index'
  resources :whitelists

  get '/application/update_all_projects/', :to => 'application#update_all_projects', :as => 'update_all_projects'
  
  get '/login/:id', :to => 'application#passthru', :as => 'passthru'

  get '/whitelists/upgrade/:id', :to => 'whitelists#upgrade', :as => 'upgrade_user'
  get '/whitelists/downgrade/:id', :to => 'whitelists#downgrade', :as => 'downgrade_user'
  
end
