Feature: manage whitelist
	As an admin
	So that I can add or drop people from whitelist
	Given the following account exist in whitelist:
	| Github Account |
	| cyb            |
	| junyu Wang	 |

	Scenario: add people to whitelist
		Given I am logged in as an admin
		And I click whitelist managment
		And whitelist has the following entries:
		When I add "shuotong" to whitelist
		Then I should see "shuotong" in whitelist

	Scenario: drop people from whitelist
		Given I am logged in as an admin
		And I click whitelist managment
		And whitelist has the following entries:
		When I drop "cyb" from whitelist
		Then I should not see "cyb" in whitelist