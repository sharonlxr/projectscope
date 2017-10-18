Feature: add and edit tasks to exisiting iteration

  As an instructor
  I want to add different tasks to an iteration and order the tasks
  So that students will know what they need to do in the iteration.
  
  Background: I am on the instructor-dashboard page
    Given I am logged in
    And I am on the dashboard page
    And I am on Iteration "iter0"

  Scenario: Instructor should see a link to add task
	  Then I should see a link to "Add Task"

  Scenario: Instructor can create a task
    When I follow "Add new task"
    Then I should be on task creation page
    
  Scenario: Instructor create a new task for the first time
    When I follow "Add new task"
    And I fill in "Task_title" with "todo1"
    And I fill in "Task_description" with "first todo"
    And I press "Create Task"
    Then I should be redirect to dashboard page
    And I should see "Successfully created task"
    And I should see "todo1"

  Scenario: task creation must specify task title
    When I follow "Add new task"
    And I fill in "Task_description" with "first todo"
    And I press "Create Task"
    Then I should see "Please fill in all required fields"
    And I should not see "Successfully created task"
    And I should be on task creation page

  Scenario: task creation must specify task description
    When I follow "Add new task"
    And I fill in "Task_title" with "todo1"
    And I press "Create Task"
    Then I should see "Please fill in all required fields"
    And I should not see "Successfully created task"
    And I should be on task creation page
  
  Scenario: add more task for a iteration
    Given I create Task "customer meeting" to "meet with customer"
    When I press "Add new task"
    And I fill in "Task_title" with "create low-fi"
    And I fill in "Task_description" with "mock up after the meeting"
    And I check "customer meeting" as parents
    And I press "Create Task"
    Then I should see "Successfully created task"
    And I should see "customer meeting"
    
  Scenario: edit existing task
    Given I create Task "customer meeting" to "meet with customer"
    When I select "customer meeting" and press edit
    And I fill in "Task_title" with "first official meeting"
    And I fill in "Task_description" with "Meeting customer for first time and learn their need"
    And I press "Save Task"
    Then I should see "Successfully save changes"
    And I should see "first official meeting"
    And I should not see "customer meeting"