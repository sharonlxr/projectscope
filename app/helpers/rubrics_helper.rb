module RubricsHelper
  COLORS = {
    unknown: '#808B96',
    good: '#2ECC71',
    moderate: '#F5B041',
    bad: '#E74C3C'
  }

  def bgcolor_for_score(score, max)
    score = score.to_f
    max = max.to_f
    if score > max * 2.0 / 3.0
      COLORS[:good]
    elsif score > max / 3.0
      COLORS[:moderate]
    elsif score > 0.0
      COLORS[:bad]
    else
      COLORS[:unknown]
    end
  end
end
