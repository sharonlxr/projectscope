class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project_metrics, only: [:show, :edit, :new]
  before_action :init_existed_configs, only: [:show, :edit, :new]
  before_action :metrics_credentials_check, only: [:show, :edit, :new]
  #http_basic_authenticate_with name: "cs169", password: ENV['PROJECTSCOPE_PASSWORD']
  # GET /projects
  # GET /projects.json

  def index
    @projects = Project.all
    @metric_names = ProjectMetrics.metric_names
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
    @project.configs.each do |config|
      name = config.metric_name
      if @project_metrics[name].respond_to?(:credentials)
       config.options.each_pair do |key,val|
            @existed_configs[name] << key.to_sym
        end
      end
    end
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

  # Set up hash mapping from name to class name check whether a metrics has credentials method.
  def set_project_metrics
    @project_metrics = ProjectMetrics.metric_names.inject({}) do |hash, name|
      hash[name] = ProjectMetrics.class_for name; hash
    end
  end
  # Check whether a metrics gem responds to credentials method
  def metrics_credentials_check
    @credentials_check = ProjectMetrics.metric_names.inject({}) do |hash, name|
      hash[name] = ProjectMetrics.class_for(name).respond_to? :credentials; hash
    end
  end

  def init_existed_configs
    @existed_configs = {}
    ProjectMetrics.metric_names.each do |name|
      @existed_configs[name] = []
    end
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
