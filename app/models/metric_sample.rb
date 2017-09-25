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
  has_many :comments
  attr_encrypted :raw_data, :key => Figaro.env.attr_encrypted_key!

  def self.latest_for metric_name
    where(:metric_name => metric_name).last
  end

  def self.min_date
    earliest_metric = MetricSample.order(:created_at).first
    earliest_metric.created_at.to_date unless earliest_metric.nil?
  end

  def days_ago
    (Date.today - created_at.to_date).to_i
  end

  # Update score and image based on user inputs
  def update_sample(metric_parameter)
    send(metric_name.to_sym, JSON.parse(metric_parameter))
  end

  private

  def story_quality(mp)
    avg_smart = mp.inject(0.0) { |sum, (_, v)| sum + v['smart'].to_i } / mp.length
    avg_complexity = mp.inject(0.0) { |sum, (_, v)| sum + v['complexity'].to_i } / mp.length
    self.score = avg_smart
    old_image = JSON.parse(image)
    old_image['data'] = old_image['data'].map do |story|
      sid = story['id'].to_s
      return story unless mp.key? sid
      story.update(\
        avg_smart: avg_smart,
        avg_complexity: avg_complexity,
        smart: mp[sid]['smart'],
        complexity: mp[sid]['complexity']
      )
    end
    self.image = old_image.to_json
    save
  end

end
