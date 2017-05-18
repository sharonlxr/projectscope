Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :skip => [:password]
  resources :comments
  resources :users, :only => [:show, :update], :path => "user"
  resources :projects do
  	member do
  		post "/add_owner", :to => "projects#add_owner"
      get '/metrics/:metric', :to => 'projects#get_metric_data'
      get '/metrics/:metric/detail', to: 'projects#show_metric'
      get '/new_edit', :to => 'projects#new_edit', :as => 'new_edit_project'
      post '/new_update', :to => 'projects#new_update', :as => 'update_metric'
  	end
  end
  resources :whitelists do
    member do
      get 'upgrade', :to => 'whitelists#upgrade', :as => 'upgrade_user'
      get 'downgrade', :to => 'whitelists#downgrade', :as => 'downgrade_user'
    end
  end

  get '/metric_samples/:metric_sample_id/comments',
      :to => 'comments#comments_for_metric_sample',
      :as => 'metric_sample_comments'

  get '/login/:id', :to => 'application#passthru', :as => 'passthru'

  root 'projects#index'
end
