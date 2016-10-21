class WhitelistController < ApplicationController

  # http_basic_authenticate_with name: "cs169", password: ENV['PROJECTSCOPE_PASSWORD']
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  ADMIN_ROLE = "admin"
  COACH_ROLE = "coach"
  
  # GET /whitelist
  def index
    if current_user.is_admin?
       @permitted_users = Authorized_user.all 
      
    else
       flash[:notice] = "You are not authorized to manipulate whitelist."
       redirect_to projects_url
    end
  end

  # GET /whitelist/index
  def show
    @readonly = true
    render :template => 'whitelist/index'
  end
  
  # GET /whitelist/new
  def new
    if current_user.is_admin?
      @authorized_user = Authorized_user.new
    else
      flash[:notice] = "You are not authorized to manipulate whitelist."
      redirect_to projects_url
    end
  end
  
  # POST /whitelist/add
  def add
    if current_user.is_admin?
        email = params[:email]
        role = params[:role]
        unless (email =~ VALID_EMAIL_REGEX)
            flash[:notice] = "Invalid Email."
            redirect_to whitelist_new_path
            return
        end
        unless (role.eql?(ADMIN_ROLE) or role.eql?(COACH_ROLE))
            flash[:notice] = "Invalid Role: Role should be 'admin' or 'coach'. "
            redirect_to whitelist_new_path
            return
        end
        Authorized_user.create!(email: email, role: role)
        flash[:notice] = "Add user #{email} successfully. "
        redirect_to whitelist_index_path
    else
       flash[:notice] = "You are not authorized to manipulate whitelist."
       redirect_to projects_url
    end
  end

  # DELETE /whitelist/
  def destroy
    user = params[:id]
    if current_user.is_admin?
      Authorized_user.find(user).destroy!
      respond_to do |format|
        format.html { redirect_to whitelist_index_path, notice: 'User account was successfully deleted.' }
      end
    else
      flash[:notice] = "You are not authorized to manipulate whitelist."
       redirect_to projects_url
    end
    
    
  end

end
