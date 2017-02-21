# == Schema Information
#
# Table name: metric_samples
#
#  id                    :integer          not null, primary key
#  project_id            :integer
#  metric_name           :string
#  encrypted_raw_data    :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  encrypted_raw_data_iv :string
#  score                 :float
#  image                 :text
#

class MetricSample < ActiveRecord::Base
  belongs_to :project
  scope :latest_for, ->(metric_name) { where(:metric_name => metric_name).last }

  attr_encrypted :raw_data, :key => Figaro.env.attr_encrypted_key!

  def self.min_date
	earliest_metric = MetricSample.order(:created_at).first
	earliest_metric.created_at.to_date unless earliest_metric.nil?
  end

  def self.all_metrics(project_id)
    projects_samples = MetricSample.all.where(:project_id => project_id)

    if(projects_samples.nil?)
      nil
    else
      all_metrics_name_ary = []
      projects_samples.each do |sample|
        all_metrics_name_ary << sample.metric_name
      end

      all_metrics_name_ary.uniq
    end
  end


  def self.latest_metric(project_id, metric_name)
    projects_samples = MetricSample.all.where(:project_id => project_id)

    result = []
    all_metrics(project_id).each do |metric_name|
      result << projects_samples.latest_for(metric_name)
    end

    result
  end

end
