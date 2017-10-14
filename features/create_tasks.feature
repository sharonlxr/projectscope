Feature: add tasks to exisiting iteration

  As an instructor
  So that I can build the tasks list for each iteration for students
  I want to add a task and specify title,discription and parents.

  Scenario: add first task for a iteration
    Given I am logged in
    And I will go to the iteration dashboard page
    And I press "create new tasks"
    And I fill in title with "customer meeting"
    And I fill in description with "talk with customer"
    And I press "Create"
    Then I should see "customer meeting" 
  Scenario: add more task for a iteration
    Given I am logged in
    And I will go to the iteration dashboard page
    And I press "create new tasks"
    And I fill in title with "create low-fi"
    And I fill in description with "mock up after the meeting"
    And I check "customer" as parents
    And I press "Create"
    Then I should see "create low-fi" 

