# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'project_metric_code_climate' 
require 'project_metric_slack_trends'
require 'project_metric_pivotal_tracker'
dummy1_code_climate = ProjectMetrics.class_for('code_climate').new url: 'http://github.com/AgileVentures/WebsiteOne'
dummy1_github = ProjectMetrics.class_for('github').new url: 'http://github.com/AgileVentures/WebsiteOne'
dummy1_slack = ProjectMetrics.class_for('slack').new(token: 'xoxp-88866518725-89002779974-99405676995-ce5416e3518e3738525b6290720418e1', channel:'general')
dummy1_pivot = ProjectMetrics.class_for('pivotal_tracker').new(token: 'd9ef66309fcefb28ccb33863a922f8f5', project:'1886749')
dummy1_slack_trends = ProjectMetrics.class_for('slack_trends').new(token: 'xoxp-88866518725-89002779974-99405676995-ce5416e3518e3738525b6290720418e1', channel:'general')

dummy2_code_climate = ProjectMetrics.class_for('code_climate').new url: 'http://github.com/AgileVentures/project_metric_slack'
dummy2_github = ProjectMetrics.class_for('github').new url: 'http://github.com/AgileVentures/project_metric_slack'
slack1 = File.read './db/image/slack1.svg'
slack2 = File.read './db/image/slack2.svg'
slack3 = File.read './db/image/slack3.svg'
slack_trends1 = File.read './db/image/slack_trends1.svg'
slack_trends2 = File.read './db/image/slack_trends2.svg'
slack_trends3 = File.read './db/image/slack_trends3.svg'
pivot1 = File.read './db/image/pivot1.svg'
pivot2 = File.read './db/image/pivot2.svg'
github1 = File.read './db/image/github1.svg'
github2 = File.read './db/image/github2.svg'
github3 = File.read './db/image/github3.svg'
Project.create!(:name => "THE ARCTIC INSTITUTE", 
    :configs => [
        Config.create!(:metric_name => 'code_climate', :project_id => 1, :options => {'url' => 'http://github.com/AgileVentures/WebsiteOne'}),
        Config.create!(:metric_name => 'github', :project_id => 1, :options => {'url' => 'http://github.com/AgileVentures/WebsiteOne'}),
        Config.create!(:metric_name => 'slack', :project_id => 1, :options => {'token' => 'xoxp-88866518725-89002779974-99405676995-ce5416e3518e3738525b6290720418e1', 'channel'=>'general'}),
        Config.create!(:metric_name => 'pivotal_tracker', :project_id => 1, :options => {'token' => 'd9ef66309fcefb28ccb33863a922f8f5', 'project'=>'1886749'}),
        Config.create!(:metric_name => 'slack_trends', :project_id => 1, :options => {'token' => 'xoxp-88866518725-89002779974-99405676995-ce5416e3518e3738525b6290720418e1', 'channel'=>'general'})
        ], 
    :metric_samples =>[
        MetricSample.create!(:metric_name => 'code_climate', :project_id => 1, :score => dummy1_code_climate.score, :raw_data => dummy1_code_climate.raw_data, :image => dummy1_code_climate.image), 
        MetricSample.create!(:metric_name => 'github', :project_id => 1, :score => dummy1_github.score, :raw_data => dummy1_github.raw_data, :image => dummy1_github.image), 
        MetricSample.create!(:metric_name => 'slack', :project_id => 1, :score => dummy1_slack.score, :raw_data => dummy1_slack.raw_data, :image => dummy1_slack.image),
        MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 1, :score =>dummy1_pivot.score, :image => dummy1_pivot.image),
        MetricSample.create!(:metric_name => 'slack_trends', :project_id => 1, :score => dummy1_slack_trends.score, :raw_data => dummy1_slack_trends.raw_data, :image => dummy1_slack_trends.image)])
Project.create!(:name => "ALZHEIMER'S GREATER LOS ANGELES", :metric_samples =>[
    MetricSample.create!(:metric_name => 'code_climate', :project_id => 2, :score => dummy2_code_climate .score, :raw_data => dummy2_code_climate .raw_data, :image =>dummy2_code_climate .image), 
    MetricSample.create!(:metric_name => 'github', :project_id => 2, :score => 0.6339563862928349, :image => github1),
    MetricSample.create!(:metric_name => 'slack', :project_id => 2, :score => 0.29861111111111116, :image => slack1),
    MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 2, :score => 0.5636833046471601, :image => pivot1),
    MetricSample.create!(:metric_name => 'slack_trends', :project_id => 2, :score => 0.32200793650793647, :image => slack_trends1)])
Project.create!(:name => "VISIONARIA NETWORK", :metric_samples =>[
    MetricSample.create!(:metric_name => 'code_climate', :project_id => 3, :score => 3.2, :image => 'https://codeclimate.com/github/AgileVentures/WebsiteOne/badges/gpa.svg'), 
    MetricSample.create!(:metric_name => 'github', :project_id => 3, :score => 0.6166666666666667, :image => github2), 
    MetricSample.create!(:metric_name => 'slack', :project_id => 3, :score => 0.25, :image => slack2),
    MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 3, :score => 0.49702380952380953, :image => pivot2),
    MetricSample.create!(:metric_name => 'slack_trends', :project_id => 3, :score => 0.42148777348777344, :image => slack_trends2)])
Project.create!(:name => "QuestionBank",
    :configs => [
        Config.create!(:metric_name => 'code_climate', :project_id => 4, :options => {'token' => 'xyz', 'user' => 'fox'}),
        Config.create!(:metric_name => 'github', :project_id => 4, :options => {'token' =>'123', 'user'=>"fox"})], 
    :metric_samples =>[
        MetricSample.create!(:metric_name => 'code_climate', :project_id => 4,  :score => 3.2, :image => 'https://codeclimate.com/github/AgileVentures/LocalSupport/badges/gpa.svg'), 
        MetricSample.create!(:metric_name => 'github', :project_id => 4, :score => 0.6339563862928349, :image => github3), 
        MetricSample.create!(:metric_name => 'slack', :project_id => 4, :score => 6, :image => slack3),
        MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 4, :score => 0),
        MetricSample.create!(:metric_name => 'slack_trends', :project_id => 4, :score => 0.4637265745007681, :image => slack_trends3)])

    
