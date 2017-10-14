# @Peijie
Feature: Instructor creates a task for an iteration
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
    And I fill in "Task_title" with "customer meeting"
    And I fill in "Task_description" with "meeting with customer"
    And I press "Create Task"
    Then I should be redirect to dashboard page
    And I should see "Successfully created task"
    And I should see "customer meeting" under "Iteration-1"
    
Scenario: task creation must specify task title
    When I follow "Add new task"
    And I fill in "Task_description" with "first todo"
    And I press "Create Task"
    Then I should see "Please fill in all required fields"
    And I should not see "Successfully created task"
    And I should be on task creation page for "Iteration-1"

Scenario: task creation must specify task description
    When I follow "Add new task"
    And I fill in "Task_title" with "todo1"
    And I press "Create Task"
    Then I should see "Please fill in all required fields"
    And I should not see "Successfully created task"
    And I should be on task creation page for "Iteration-1"
    
Scenario: edit existing task
  Given I create task "customer meeting" to "meeting with customer"
  And I select "customer meeting" and press "Edit Task"
  And I fill in "Task_title" with "GSI checkin"
  And I fill in "Task_description" with "weekly check-in with Avi"
  When I press "Save Changes"
  Then I should see "Task Updated"
  And I should see "GSI checkin"
  And I should not see "customer meeting"
  
Scenario: add more task for a iteration
  Given I create task "first meeting" to "1st meeting with customer"
  And I create task "second meeting" to "2nd meeting with customer"
  Then I should see "first meeting" before "second meeting"