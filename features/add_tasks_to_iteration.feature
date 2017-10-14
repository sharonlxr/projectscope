# @Peijie
Feature: Instructor creates a task for an iterations
  As an instructor
  I want to add different tasks to an iteration
  So that students will know what they need to do in the iteration.
  
Background: I am on the instructor-dashboard page
  Given I am on the dashboard page
  And I am under "Iteration-1"

Scenario: Instructor should see a link to add task
	Then I should see a link to "Add Task"

Scenario: Instructor can create a task
    When I follow "Add new task"
    Then I should be on task creation page for "Iteration-1"
    
Scenario: Instructor create a new task
    When I follow "Add new task"
    And I fill in "Task_name" with "todo1"
    And I fill in "Task_description" with "first todo"
    And I press "Create Task"
    Then I should see "Successfully created task"
    And I should see "todo1" under "Iteration-1"
    And I should be redirect to dashboard page

Scenario: task creation must specify task name
    When I follow "Add new task"
    And I fill in "Task_description" with "first todo"
    And I press "Create Task"
    Then I should see "Please fill in all required fields"
    And I should not see "Successfully created task"
    And I should be on task creation page for "Iteration-1"

Scenario: task creation must specify task description
    When I follow "Add new task"
    And I fill in "Task_name" with "todo1"
    And I press "Create Task"
    Then I should see "Please fill in all required fields"
    And I should not see "Successfully created task"
    And I should be on task creation page for "Iteration-1"