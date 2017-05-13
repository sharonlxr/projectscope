class ProjectGradingsController < ApplicationController
  before_action :set_project_grading, only: [:show, :edit, :update, :destroy]

  # GET /project_gradings
  # GET /project_gradings.json
  def index
    @project_gradings = ProjectGrading.all
  end

  # GET /project_gradings/1
  # GET /project_gradings/1.json
  def show
  end

  # GET /project_gradings/new
  def new
    @project_grading = ProjectGrading.new
  end

  # GET /project_gradings/1/edit
  def edit
  end

  # POST /project_gradings
  # POST /project_gradings.json
  def create
    @project_grading = ProjectGrading.new(project_grading_params)

    respond_to do |format|
      if @project_grading.save
        format.html { redirect_to @project_grading, notice: 'Project grading was successfully created.' }
        format.json { render :show, status: :created, location: @project_grading }
      else
        format.html { render :new }
        format.json { render json: @project_grading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_gradings/1
  # PATCH/PUT /project_gradings/1.json
  def update
    respond_to do |format|
      if @project_grading.update(project_grading_params)
        format.html { redirect_to @project_grading, notice: 'Project grading was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_grading }
      else
        format.html { render :edit }
        format.json { render json: @project_grading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_gradings/1
  # DELETE /project_gradings/1.json
  def destroy
    @project_grading.destroy
    respond_to do |format|
      format.html { redirect_to project_gradings_url, notice: 'Project grading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_grading
      @project_grading = ProjectGrading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_grading_params
      params.require(:project_grading).permit(:project_id, :metric_name, :grade, :created_at)
    end
end
