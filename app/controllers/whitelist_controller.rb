class WhitelistController < ApplicationController

  # http_basic_authenticate_with name: "cs169", password: ENV['PROJECTSCOPE_PASSWORD']

  # GET /whitelist
  def index
    if current_user.is_admin?
       @permitted_users = AuthorizedUser.all 
      
    else
       flash[:notice] = "You are not authorized to manipulate whitelist."
       redirect_to projects_url
    end
  end
  
  # GET /whitelist/new
  def new
    if current_user.is_admin?
      @authorized_user = AuthorizedUser.new
    else
      flash[:notice] = "You are not authorized to manipulate whitelist."
      redirect_to projects_url
    end
  end
  
  # POST /whitelist/
  def create
    if current_user.is_admin?
        email = params[:email]
        if AuthorizedUser.has_email?(email)
          flash[:notice] = "User #{email} already exists in whitelist. "
          redirect_to whitelist_index_path
          return
        end
        AuthorizedUser.create!(email: email)
        flash[:notice] = "Add user #{email} successfully. "
        redirect_to whitelist_index_path
    else
       flash[:notice] = "You are not authorized to manipulate whitelist."
       redirect_to projects_url
    end
  end

  # DELETE /whitelist/
  def destroy
    user = AuthorizedUser.find(params[:id])
    if current_user.is_admin?
      user.destroy!
      flash[:notice] = "User is deleted successfully. "
      redirect_to whitelist_index_path
    else
      flash[:notice] = "You are not authorized to manipulate whitelist."
       redirect_to projects_url
    end
    
    
  end

end
