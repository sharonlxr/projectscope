Feature: sort projects by metrics
	As a coach or admin on the dashboard page
	So that I can sort the projects by different metrics

Background: projects in database

	Given the following projects exist:
	| project name  | code_climate | github | slack | pivotal tracker |
	| project scope | 1            | 10     | 6     |  8              |
	| city dog		| 2  		   | 9      | 3     |  5              |
	| esential		| 3			   | 7      | 1     |  9              |
	| faludi design | 5            | 8      | 10    |  4              |
	| oram			| 4            | 6      | 9     |  10             |

	Scenario: sort by code_climate
		Given I am on the dashboard page
		And I sort projects by code_climate
		Then projects should be sorted by code_climate

	Scenario: sort by github
		Given I am on the dashboard page
		And I sort projects by github
		Then projects should be sorted by github

	Scenario: sort by slack
		Given I am on the dashboard page
		And I sort projects by slack
		Then projects should be sorted by slack

	Scenario: sort by pivotal tracker
		Given I am on the dashboard page
		And I sort projects by pivotal tracker
		Then projects should be sorted by pivotal tracker


