require 'rails_helper'
require 'spec_helper'

describe Project do
	describe 'when ordered by metrics' do
		before(:each) do
			@p1 = create(:project)
			@p2 = create(:project)
			@p1.metric_samples.create(:metric_name => "test_metric", :score => 1, :created_at => Date.today)
			@p1.metric_samples.create(:metric_name => "test_metric", :score => 2, :created_at => Date.today - 1.day)
			@p2.metric_samples.create(:metric_name => "test_metric", :score => 3, :created_at => Date.today)
			@p2.metric_samples.create(:metric_name => "test_metric", :score => 4, :created_at => Date.today - 1.day)
		end

		it 'should be sorted by project name' do
			projects = Project.order_by_name("ASC")
			expect(projects[0].id).to eq @p1.id
		end

		it 'should be sorted by metrics' do
			projects = Project.order_by_metric_score "test_metric", "ASC"
			expect(projects[0].id).to eq @p1.id
		end

		it 'should not have duplicate entries' do
			projects = Project.order_by_metric_score "test_metric", "ASC"
			expect(projects.length).to eq 2
		end
	end
end