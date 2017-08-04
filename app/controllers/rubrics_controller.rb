class RubricsController < ApplicationController
  before_action :set_rubric, only: [:show, :edit, :update, :destroy]

  # GET /rubrics
  # GET /rubrics.json
  def index
    @rubrics = Rubric.all
  end

  # GET /rubrics/1
  # GET /rubrics/1.json
  def show
  end

  # GET /rubrics/new
  def new
    @rubric = Rubric.new
    @params = Hash.new(nil)
  end

  # GET /rubrics/1/edit
  def edit
    @params = JSON.parse @rubric.params
  end

  # POST /rubrics
  # POST /rubrics.json
  def create
    @rubric = Rubric.new(rubric_params)

    respond_to do |format|
      if @rubric.save
        format.html { redirect_to @rubric, notice: 'Rubric was successfully created.' }
        format.json { render :show, status: :created, location: @rubric }
      else
        format.html { render :new }
        format.json { render json: @rubric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rubrics/1
  # PATCH/PUT /rubrics/1.json
  def update
    respond_to do |format|
      if @rubric.update(rubric_params)
        format.html { redirect_to @rubric, notice: 'Rubric was successfully updated.' }
        format.json { render :show, status: :ok, location: @rubric }
      else
        format.html { render :edit }
        format.json { render json: @rubric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rubrics/1
  # DELETE /rubrics/1.json
  def destroy
    @rubric.destroy
    respond_to do |format|
      format.html { redirect_to rubrics_url, notice: 'Rubric was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /projects/1/grades/2
  def project_grade
    @rubrics = Rubric.where(iteration: params[:iid].to_i).all
    days_from_now = params[:days_from_now] ? params[:days_from_now].to_i : 0
    date = Date.today - days_from_now.days
    @project = Project.find params[:id]
    @metric_samples = @rubrics.map do |rubric|
      @project.metric_on_date(rubric.metric_name, date).last
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rubric
    @rubric = Rubric.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rubric_params
    params[:rubric][:params] = params[:rubric][:params].to_json
    params.require(:rubric).permit(:iteration, :metric_name, :params)
  end
end
