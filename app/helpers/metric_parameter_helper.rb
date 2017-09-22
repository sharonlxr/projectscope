module MetricParameterHelper

  def find_story(sid)
    @samples.detect { |sample| sample['id'].to_s.eql? sid }
  end
end
