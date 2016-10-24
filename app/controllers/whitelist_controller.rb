class WhitelistController < ApplicationController
  include ActiveModel::Validations
  before_action :check_if_admin

  # GET /whitelist
  def index
    @permitted_users = Whitelist.all 
  end
  
  # GET /whitelist/new
  def new
    @authorized_user = Whitelist.new
  end
  
  # POST /whitelist/
  def create
    email = params[:email]
    if Whitelist.has_email?(email)
      flash[:notice] = "User #{email} already exists in whitelist. "
    else
      begin
        Whitelist.create!(email: email)
        flash[:notice] = "Add user #{email} successfully."
      rescue ActiveRecord::RecordInvalid
        flash[:notice] = "Invalid Email format."
      end
    end
    redirect_to whitelist_index_path
  end

  # DELETE /whitelist/
  def destroy
    user = Whitelist.find(params[:id])
    user.destroy!
    flash[:notice] = "User is deleted successfully. "
    redirect_to whitelist_index_path
  end
  
  def check_if_admin
    unless current_user.is_admin?
       flash[:notice] = "You are not authorized to manipulate whitelist."
       redirect_to projects_url
    end
  end
  
end
