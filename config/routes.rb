Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :skip => [:password]
  resources :comments
  resources :users, :only => [:show, :update], :path => "user"
  resources :projects do
    collection do
      post "/metrics_on_date", :to => "projects#metrics_on_date"
    end
  	member do
  		post "/add_owner", :to => "projects#add_owner"
      get '/metrics/:metric', :to => 'projects#get_metric_data'
      get '/metrics/:metric/detail', to: 'projects#show_metric'
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

  # get '/application/update_all_projects/', :to => 'application#update_all_projects', :as => 'update_all_projects'

  get '/login/:id', :to => 'application#passthru', :as => 'passthru'

  get '/dev', :to => 'projects#new_index', :as => 'new_index'
  get 'all_metrics/:id', :to => 'projects#all_metrics', :as => 'all_metrics'
  get '/charts', :to => 'projects#charts'
  get 'projects/:id/new_edit', :to => 'projects#new_edit', :as => "new_edit_project"
  post 'projects/:id/new_update', :to => 'projects#new_update', :as => "update_metric"
  root 'projects#new_index'
end
