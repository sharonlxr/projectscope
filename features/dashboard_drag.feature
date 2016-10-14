Feature: sort projects by metrics
	As a coach or admin on the dashboard page
	So that I can drag projects in table

Background: projects in database

	Given the following projects exist:
	| project name  | code_climate | github | slack | pivotal tracker |
	| project scope | 1            | 10     | 6     |  8              |
	| city dog		| 2  		   | 9      | 3     |  5              |
	| esential		| 3			   | 7      | 1     |  9              |
	| faludi design | 5            | 8      | 10    |  4              |
	| oram			| 4            | 6      | 9     |  10             |

	Scenario: drag upwards
	Given I am on the dashboard page
	And I drag oram before city dog
	Then I should see oram before city dog

	Scenario: drag downwards
	Given I am on the dashboard page
	And I drag project scope after faludi design
	Then I should see project scope after faludi design