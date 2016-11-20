class WhitelistsController < ApplicationController
  before_action :check_if_in_whitelist
  attr_accessor :username

  # GET /whitelists
  def index
    @permitted_users = Whitelist.all 
  end
  
  # GET /whitelists/new
  def new
    @authorized_user = Whitelist.new
  end
  
  # POST /whitelists/
  def create
    username = params[:username]
    if Whitelist.has_username?(username)
      flash[:notice] = "User #{username} already exists in whitelist. "
    else
      begin
        Whitelist.create!(username: username)
        flash[:notice] = "Add user #{username} successfully."
      rescue ActiveRecord::RecordInvalid
        flash[:notice] = "Invalid username format."
      end
    end
    redirect_to whitelists_path
  end

  # DELETE /whitelists/
  def destroy
    user = Whitelist.find(params[:id])
    if user.username.eql?(current_user.provider_username)
      flash[:notice] = "We just saved you from being an idiot. "
    else
      user.destroy!
      flash[:notice] = "User is deleted successfully."
    end
    redirect_to whitelists_path
  end
  
  def check_if_in_whitelist
    unless Whitelist.has_username?(current_user.provider_username)
       flash[:notice] = "You are not authorized to manipulate whitelist."
       redirect_to projects_url
    end
  end
  
end
