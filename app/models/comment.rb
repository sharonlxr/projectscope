class Comment < ActiveRecord::Base
  belongs_to :metric_sample
  belongs_to :user
end
