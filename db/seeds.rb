# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'project_metric_code_climate'
# require 'project_metric_slack_trends'
# require 'project_metric_pivotal_tracker'

User.delete_all
Whitelist.delete_all
Project.delete_all
MetricSample.delete_all


# dummy1_code_climate = ProjectMetrics.class_for('code_climate').new url: 'http://github.com/AgileVentures/WebsiteOne'
# dummy2_code_climate = ProjectMetrics.class_for('code_climate').new url: 'http://github.com/AgileVentures/project_metric_slack'


slack1 = '{
							"chartType":"pie",
							"titleText":"Story Status",
							"data":[{
												"name": "Story Status",
												 "colorByPoint": true,
										     "data": [{
													 "name": "Delivered",
													 "y": 56.33
												 }, {
													 "name": "Started",
													 "y": 24.03,
													 "sliced": true,
													 "selected": true
												 }, {
													 "name": "Finished",
													 "y": 10.38
												 }, {
													 "name": "Unstarted",
													 "y": 9.26
										     }]
										 }]
					}'
slack2 = '{
							"chartType":"pie",
							"titleText":"Story Status",
							"data":[{
												"name": "Story Status",
												 "colorByPoint": true,
										     "data": [{
													 "name": "Delivered",
													 "y": 35.27
												 }, {
													 "name": "Started",
													 "y": 33.10,
													 "sliced": true,
													 "selected": true
												 }, {
													 "name": "Finished",
													 "y": 24.72
												 }, {
													 "name": "Unstarted",
													 "y": 35.93
										     }]
										 }]
					}'
slack3 = '{
							"chartType":"pie",
							"titleText":"Story Status",
							"data":[{
												"name": "Story Status",
												 "colorByPoint": "true",
										     "data": [{
													 "name": "Delivered",
													 "y": 31.73
												 }, {
													 "name": "Started",
													 "y": 24.57,
													 "sliced": true,
													 "selected": true
												 }, {
													 "name": "Finished",
													 "y": 18.12
												 }, {
													 "name": "Unstarted",
													 "y": 4.38
										     }]
										 }]
					}'
dummy1_code_climate = slack1
dummy2_code_climate = slack3
slack_trends1 = '{
										"chartType" : "spline",
										"titleText" : "Foo",
										"subtitleText" : "",
										"xAxisTitleText" : "",
										"yAxisTitleText" : "",
										"data" : [[0, 9], [1, 7], [2, 0], [3, 1], [4, 5],
												[5, 3], [6, 2], [7, 9], [8, 0]]
								}'
slack_trends2 = '{
										"chartType" : "spline",
										"titleText" : "Bar",
										"subtitleText" : "",
										"xAxisTitleText" : "",
										"yAxisTitleText" : "",
										"data" : [[0, 8], [1, 1], [2, 5], [3, 1], [4, 0],
												[5, 7], [6, 3], [7, 6], [8, 7]]
								}'
slack_trends3 = '{
										"chartType" : "spline",
										"titleText" : "Fubar",
										"subtitleText" : "",
										"xAxisTitleText" : "",
										"yAxisTitleText" : "",
										"data" : [[0, 7], [1, 3], [2, 7], [3, 3], [4, 0],
												[5, 9], [6, 5], [7, 8], [8, 5]]
								}'

gauge1 = '{"chartType" : "gauge", "titleText" : "Story Management GPA", "data" : {"score" : 3.5}}'
gauge2 = '{"chartType" : "gauge", "titleText" : "Story Management GPA", "data" : {"score" : 2.3}}'
gauge3 = '{"chartType" : "gauge", "titleText" : "Story Management GPA", "data" : {"score" : 1.6}}'

collective_gauge1 = '{"chartType" : "gauge", "titleText" : "Collective Ownership GPA", "data" : {"score" : 3.5}}'
collective_gauge2 = '{"chartType" : "gauge", "titleText" : "Collective Ownership GPA", "data" : {"score" : 2.3}}'
collective_gauge3 = '{"chartType" : "gauge", "titleText" : "Collective Onwership GPA", "data" : {"score" : 1.6}}'

story_1 = open('./db/fake_data/p1.json', 'r') { |f| f.read }
story_2 = open('./db/fake_data/p2.json', 'r') { |f| f.read }
story_3 = open('./db/fake_data/p3.json', 'r') { |f| f.read }

point_est1 = open('./db/fake_data/point_est1.json', 'r') { |f| f.read }
point_est2 = open('./db/fake_data/point_est2.json', 'r') { |f| f.read }
point_est3 = open('./db/fake_data/point_est3.json', 'r') { |f| f.read }

# slack_trends2 = File.read './db/images/slack_trends2.svg'
# slack_trends3 = File.read './db/images/slack_trends3.svg'
pivot1 = slack1
pivot2 = slack2
pivot3 = slack3
github1 = slack_trends1
github2 = slack_trends2
github3 = slack_trends3


dummies = Hash.new
dummies["code_climate"] = [dummy1_code_climate, dummy2_code_climate, dummy1_code_climate]
dummies["github"] = [github1, github2, github3]
dummies["slack"] = [slack1, slack2,	slack3]
dummies["pivotal_tracker"] = [pivot1, pivot2, pivot3]
dummies["slack_trends"] = [slack_trends1, slack_trends2, slack_trends3]
dummies["story_transition"] = [story_1, story_2, story_3]
dummies["point_estimation"] = [point_est1, point_est2, point_est3]
dummies["story_overall"] = [gauge1, gauge2, gauge3]
dummies["collective_overview"] = [collective_gauge1, collective_gauge2, collective_gauge3]

projects_list = []
0.upto(10).each do |num|
	projects_list << Project.create!(:name => "Project #{num}")
end

end_date = Date.today
start_date = end_date - 7.days

# Config.delete_all

projects_list.each do |project|
    ProjectMetrics.metric_names.each do |metric|
        if TRUE
            start_date.upto(end_date) do |date|
                MetricSample.create!(:metric_name => metric,
                                 :project_id => project.id,
                                 :score => rand(0.0..4.0).round(2),
                                 :image => dummies[metric][rand(3)],
                                 :created_at => date)
            end
            Config.create(:metric_name => metric,
        				:project_id => project.id,
        				:token => (0...50).map { ('a'..'z').to_a[rand(26)] }.join,
        				:metrics_params => "TOKEN")
    		Config.create(:metric_name => metric,
    					:project_id => project.id,
    					:token => (0...50).map { ('a'..'z').to_a[rand(26)] }.join,
    					:metrics_params => "URL")
        end
    end
end


@user01 = User.create!(provider_username: "Clarkkkk", uid: "Clark",
    provider: "developer", role: "admin", password: Devise.friendly_token[0,20], preferred_metrics: [{
			# "code_climate"=>["code_climate", "github", "pivotal_tracker", "slack", "slack_trends", "point_estimation", "story_transition", "story_overall"],
			# "github"=>["code_climate", "github", "pivotal_tracker", "slack", "slack_trends", "point_estimation", "story_transition", "story_overall"],
      "story_overall"=>["pivotal_tracker", "point_estimation", "story_transition"],
			# "pivotal_tracker"=>["code_climate", "github", "pivotal_tracker", "slack", "slack_trends", "point_estimation", "story_transition", "story_overall"],
			# "slack"=>["code_climate", "github", "pivotal_tracker", "slack", "slack_trends", "point_estimation", "story_transition", "story_overall"],
			# "slack_trends"=>["code_climate", "github", "pivotal_tracker", "slack", "slack_trends", "point_estimation", "story_transition", "story_overall"],
      # "point_estimation"=>["code_climate", "github", "pivotal_tracker", "slack", "slack_trends", "point_estimation", "story_transition", "story_overall"],
      # "story_transition"=>["code_climate", "github", "pivotal_tracker", "slack", "slack_trends", "point_estimation", "story_transition", "story_overall"]
      "collective_overview"=>["code_climate", "github"]
			}], preferred_projects: projects_list)
Whitelist.create!(username: @user01.provider_username)
