Rails.application.routes.draw do
  resources :users, :only => [:show, :update], :path => "u"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :skip => [:password]
  
  resources :projects do
    collection do
      post "/metrics_on_date", :to => "projects#metrics_on_date"
    end
  	member do
  		post "/add_owner", :to => "projects#add_owner"
  	end
  end
  root 'projects#index'
end
