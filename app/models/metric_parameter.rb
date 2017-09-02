class MetricParameter < ActiveRecord::Base
  belongs_to :metric_sample

  UNASSIGNED = 0
  ASSIGNED = 1

  def self.create_parameter(metric_name, metric_sample)
    params = ProjectMetrics.class_for(metric_name).get_params(metric_sample)
    create params
  end

end
