class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  attr_accessor :pre_click, :order
  http_basic_authenticate_with name: "cs169", password: ENV['PROJECTSCOPE_PASSWORD']
  
  # GET /projects
  # GET /projects.json
  def initialize(x = "", y = "ASC")
    # Notice that `@` indicates instance variables.
    @pre_click = x
    @order = y
  end
  def index
    click_type = params[:type]
    @projects = Project.all
    @metric_names = ProjectMetrics.metric_names
    if click_type == "project_name"
      if self.pre_click==click_type
        if self.order == "ASC"
          @projects = Project.order(name: :desc)
          self.order = "DECS"
        end
      end
      self.pre_click = click_type
      @projects = Project.order(:name)
      
    elsif click_type == "code_climate" || click_type == "github"||click_type == "slack_trends"||click_type == "slack"||click_type == "pivotal_tracker"
      @projects = Project.joins(:metric_samples).where("metric_samples.metric_name = ?", click_type).order("metric_samples.score")
      
    end
      
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @readonly = true
    render :template => 'projects/edit'
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.attributes = project_params
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.includes(:configs).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    # Grab new option keys/vals from params, and incorporate them into
    #  the configs existing keys/vals.
    # Example: given params['config']['code_climate']
    #  BEFORE: {"options"=>{"token"=>"xyz", "user"=>"fox"}, "new"=>["a", "2", "b", "3"]}
    #  AFTER:  {"options"=>{"token"=>"xyz", "user"=>"fox", "a" => "2", "b" => "3"}
    params['project']['configs_attributes'].each_pair do |index, v|
      v['options'] ||= {}
      # ingest new options from new[] array
      v['options'].merge!(Hash[*(v.delete('new'))])
      # delete options with blank values
      v['options'].delete_if { |k,v| v.blank? }
    end
    params['project']
  end
end
