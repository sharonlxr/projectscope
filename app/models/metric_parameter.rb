class MetricParameter < ActiveRecord::Base
  belongs_to :metric_sample

  UNASSIGNED = 0
  ASSIGNED = 1

  def self.create_parameter(metric_name, metric_sample)
    params = ProjectMetrics.class_for(metric_name).get_params(

    )
    create params
  end

  def self.latest_params_for(metric_name)
    MetricParameter.where(metric_name: metric_name).order(:created_at).last
  end

end
