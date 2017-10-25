Feature: publish tasks to all the teams and edit for each team

  As an instructor
  I want to add different tasks to an iteration and order the tasks
  So that students will know what they need to do in the iteration.
  
  Background: I am on the instructor-dashboard page
    Given Create team "team1"
    Given Create team "team2"
    Given I am logged in
    And I have "iteration_1" iterations created
    And I am on the "iteration dashboard" page
    And I follow "iteration_1"
    Given I create Task "customer meeting" to "meet with customer"
    When I follow "Add new task"
    And I fill in "task_title" with "create low-fi"
    And I fill in "task_description" with "mock up after the meeting"
    And I should see "customer meeting"
    And I check "tasks[customer meeting]"
    And I press "Create Task"
 

 
  
    Scenario: publish task to students and see team's general graph
        Then I press "publish tasks"
        And I am on the "tasks are published" page
        Then I should see graph for "team1"
        Then I should see graph for "team2"
        
    Scenario: each team's graph can be clicked for edit
        Then I press "publish tasks"
        And I am on the "tasks are published" page
        Then I should see graph for "team1"
        Then I should see graph for "team2"
        Then I follow the graph for "team1"
        Then I should be on the tasks page for "team1"
        
    Scenario: edit for individual team's tasks
        Then I press "publish tasks"
        And I am on the "tasks are published" page
        Then I should see graph for "team1"
        Then I should see graph for "team2"
        Then I follow the graph for "team1"
        Then I should be on the tasks page for "team1"
        Then I edit "create low_fi"
        And I fill in "task_title" with "create high-fi"
        And I fill in "task_description" with "work with the customer"
        Then I press "save"
        Then I should be on the tasks page for "team1"
        Then I should see "create high-fi"
        Then I should not see "create low-fi"
  