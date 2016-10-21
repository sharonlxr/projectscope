class WhitelistController < ApplicationController
  # before_action :set_whitelist, only: [:show, :add, :delete, ]

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
  
  # DELETE /whitelist/delete
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
  
  def set_whitelist
  end


#   # GET /projects/1/edit
#   def edit
#   end

#   # POST /projects
#   # POST /projects.json
#   def create
#     @project = Project.new(project_params)
#     respond_to do |format|
#       if @project.save
#         format.html { redirect_to @project, notice: 'Project was successfully created.' }
#         format.json { render :show, status: :created, location: @project }
#       else
#         format.html { render :new }
#         format.json { render json: @project.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /projects/1
#   # PATCH/PUT /projects/1.json
#   def update
#     @project.attributes = project_params
#     respond_to do |format|
#       if @project.save
#         format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
#         format.json { render :show, status: :ok, location: @project }
#       else
#         format.html { render :edit }
#         format.json { render json: @project.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /projects/1
#   # DELETE /projects/1.json
#   def destroy
#     @project.destroy
#     respond_to do |format|
#       format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private

#   # Use callbacks to share common setup or constraints between actions.
#   def set_project
#     @project = Project.includes(:configs).find(params[:id])
#   end

#   # Never trust parameters from the scary internet, only allow the white list through.
#   def project_params
#     # Grab new option keys/vals from params, and incorporate them into
#     #  the configs existing keys/vals.
#     # Example: given params['config']['code_climate']
#     #  BEFORE: {"options"=>{"token"=>"xyz", "user"=>"fox"}, "new"=>["a", "2", "b", "3"]}
#     #  AFTER:  {"options"=>{"token"=>"xyz", "user"=>"fox", "a" => "2", "b" => "3"}
#     params['project']['configs_attributes'].each_pair do |index, v|
#       v['options'] ||= {}
#       # ingest new options from new[] array
#       v['options'].merge!(Hash[*(v.delete('new'))])
#       # delete options with blank values
#       v['options'].delete_if { |k,v| v.blank? }
#     end
#     params['project']
#   end
end
