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
dummy1_github = ProjectMetrics.class_for('github').new url: 'https://github.com/AgileVentures/LocalSupport'
dummy1_slack = ProjectMetrics.class_for('slack').new(token: 'xoxp-88866518725-89002779974-99405676995-ce5416e3518e3738525b6290720418e1', channel:'CS169-ProjectScope')
dummy1_pivot = ProjectMetrics.class_for('pivotal_tracker').new(token: 'd9ef66309fcefb28ccb33863a922f8f5', project:'1886749')

sample2 = ProjectMetrics.class_for('code_climate').new url: 'http://github.com/AgileVentures/project_metric_slack'
Project.create!(:name => "THE ARCTIC INSTITUTE", 
    :configs => [
        Config.create!(:metric_name => 'code_climate', :project_id => 1, :options => {'url' => 'http://github.com/AgileVentures/WebsiteOne'}),
        Config.create!(:metric_name => 'github', :project_id => 1, :options => {'url' => 'http://github.com/AgileVentures/WebsiteOne'})], 
    :metric_samples =>[
        MetricSample.create!(:metric_name => 'code_climate', :project_id => 1, :score => dummy1_code_climate.score, :raw_data => dummy1_code_climate.raw_data, :image => dummy1_code_climate.image), 
        MetricSample.create!(:metric_name => 'github', :project_id => 1, :score => dummy1_github.score, :raw_data => dummy1_github.raw_data, :image => dummy1_github.image), 
        MetricSample.create!(:metric_name => 'slack', :project_id => 1, :score => 5),
        MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 1, :score =>dummy1_pivot.score, :image => dummy1_pivot.image),
        MetricSample.create!(:metric_name => 'slack_trends', :project_id => 1, :score => 3)])
Project.create!(:name => "ALZHEIMER'S GREATER LOS ANGELES", :metric_samples =>[
    MetricSample.create!(:metric_name => 'code_climate', :project_id => 2, :score => sample2.score, :raw_data => sample2.raw_data, :image => sample2.image), 
    MetricSample.create!(:metric_name => 'github', :project_id => 2, :score => 7), 
    MetricSample.create!(:metric_name => 'slack', :project_id => 2, :score => 15),
    MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 2, :score => 14),
    MetricSample.create!(:metric_name => 'slack_trends', :project_id => 2, :score => 4)])
Project.create!(:name => "VISIONARIA NETWORK", :metric_samples =>[
    MetricSample.create!(:metric_name => 'code_climate', :project_id => 3, :score => 9), 
    MetricSample.create!(:metric_name => 'github', :project_id => 3, :score => 4), 
    MetricSample.create!(:metric_name => 'slack', :project_id => 3, :score => 3),
    MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 3, :score => 12),
    MetricSample.create!(:metric_name => 'slack_trends', :project_id => 3, :score => 14)])
Project.create!(:name => "ACCCOS", :metric_samples =>[
    MetricSample.create!(:metric_name => 'code_climate', :project_id => 4, :score => 13), 
    MetricSample.create!(:metric_name => 'github', :project_id => 4, :score => 6), 
    MetricSample.create!(:metric_name => 'slack', :project_id => 4, :score => 9),
    MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 4, :score => 3),
    MetricSample.create!(:metric_name => 'slack_trends', :project_id => 4, :score => 7)])
Project.create!(:name => "ORINDA POLICE DEPARTMENT", :metric_samples =>[
    MetricSample.create!(:metric_name => 'code_climate', :project_id => 5, :score => 3), 
    MetricSample.create!(:metric_name => 'github', :project_id => 5, :score => 2), 
    MetricSample.create!(:metric_name => 'slack', :project_id => 5, :score => 5),
    MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 5, :score => 4),
    MetricSample.create!(:metric_name => 'slack_trends', :project_id => 5, :score => 6)])
Project.create!(:name => "ESENTIAL", :metric_samples =>[
    MetricSample.create!(:metric_name => 'code_climate', :project_id => 6, :score => 3), 
    MetricSample.create!(:metric_name => 'github', :project_id => 6, :score => 1), 
    MetricSample.create!(:metric_name => 'slack', :project_id => 6, :score => 7),
    MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 6, :score => 5),
    MetricSample.create!(:metric_name => 'slack_trends', :project_id => 6, :score => 9)])
Project.create!(:name => "ProjectScope", :metric_samples =>[
    MetricSample.create!(:metric_name => 'code_climate', :project_id => 7, :score => 23), 
    MetricSample.create!(:metric_name => 'github', :project_id => 7, :score => 22), 
    MetricSample.create!(:metric_name => 'slack', :project_id => 7, :score => 15),
    MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 7, :score => 14),
    MetricSample.create!(:metric_name => 'slack_trends', :project_id => 7, :score => 16)])
Project.create!(:name => "CALIFORNIA POETS IN THE SCHOOLS", :metric_samples =>[
    MetricSample.create!(:metric_name => 'code_climate', :project_id => 8, :score => 4), 
    MetricSample.create!(:metric_name => 'github', :project_id => 8, :score => 3), 
    MetricSample.create!(:metric_name => 'slack', :project_id => 8, :score => 7),
    MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 8, :score => 3),
    MetricSample.create!(:metric_name => 'slack_trends', :project_id => 8, :score => 5)])
Project.create!(:name => "QuestionBank",
                :configs => [
                    Config.create!(:metric_name => 'code_climate', :options => {'token' => 'xyz', 'user' => 'fox'}),
                    Config.create!(:metric_name => 'github', :options => {'token' =>'123', 'user'=>"fox"})], 
                :metric_samples =>[
                    MetricSample.create!(:metric_name => 'code_climate', :project_id => 9, :score => 5), 
                    MetricSample.create!(:metric_name => 'github', :project_id => 9, :score => 4), 
                    MetricSample.create!(:metric_name => 'slack', :project_id => 9, :score => 6),
                    MetricSample.create!(:metric_name => 'pivotal_tracker', :project_id => 9, :score => 2),
                    MetricSample.create!(:metric_name => 'slack_trends', :project_id => 9, :score => 6)])
