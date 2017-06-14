class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :log_user

  def passthru
    user_id = params[:id]
    sign_in_and_redirect User.find_by(uid: user_id)
  end


  def update_all_projects
    Project.all.each{|ele| ele.resample_all_metrics}
    redirect_to projects_path
  end

  def log_user
    if current_user
      logger.info "User Email: #{current_user.email}"
      logger.info "User Role: #{current_user.role}"
    end
  end

end
