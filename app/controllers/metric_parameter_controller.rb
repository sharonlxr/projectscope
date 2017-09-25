class MetricParameterController < ApplicationController
  before_action :parse_conditions, only: %I[index]
  before_action :set_project
  before_action :set_parameter, only: %I[show update edit]

  def index
    @metric_parameters = @filter_params[:metric_names].map do |metric_name|
      MetricParameter.latest_params_for metric_name
    end
  end

  def show
  end

  def edit
    @parameters = JSON.parse(@metric_parameter.parameters)
    @metric_sample = @metric_parameter.metric_sample
    @samples = JSON.parse(@metric_sample.image)['data']
  end

  def update
    new_params = params['metric_parameter']
    old_params = JSON.parse(@metric_parameter.parameters)
    old_params.each do |key, val|
      if new_params.has_key? key
        old_params[key] = val.update new_params[key]
        old_params[key]['state'] = 1
      end
    end
    @metric_parameter.parameters = old_params.to_json
    @metric_parameter.save
    @metric_parameter.update_sample
    flash[:notice] = 'Parameter successfully updated!'
    redirect_to edit_metric_parameter_path(@metric_parameter)
  end

  private

  def set_project
    @project = Project.find params[:project_id] if params[:project_id]
  end

  def set_parameter
    @metric_parameter = MetricParameter.find params[:id]
  end

  def parse_conditions
    @filter_params = {}
    @filter_params[:metric_names] = params[:metric_names].split(',')
  end

end
