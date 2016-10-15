Feature: login
	Scenario: authrozied admin login
		Given I am on the login page
		And I fill in authroized credentials as admin
		Then I should be on the dashboard page
		And I should see whitelist management

	Scenario: authrozied coach login
		Given I am on the login page
		And I fill in authroized credentials as coach
		Then I should be on the dashboard page
		And I should not see whitelist management

	Scenario: unauthrozied user login
		Given I am on the login page
		And I fill in unauthroized credentials
		Then I should not be on the dashboard page
		And I should be on the login page
		And I should see "You are not authroized."
