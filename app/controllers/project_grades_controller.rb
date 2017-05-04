class ProjectGradesController < ApplicationController
  before_action :get_grades, only: [:show, :create]
  before_action :get_grade, only: [:update, :fetch]

  def show
    render json: @grades.sort { |x, y| x.created_at <=> y.created_at }
  end

  def update
    render json: { message: nil }
  end

  def create
    @grade = ProjectGrade.new(project_grade_params)
  end

  def fetch
    render json: @grade
  end

  private

  def get_grades
    @grades = ProjectGrade.where project_id: params[:project_id], metric_name: params[:id]
  end

  def get_grade
    @grade = ProjectGrade.find params[:id]
  end
end
