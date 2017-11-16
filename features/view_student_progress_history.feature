Feature: view student progress history

    As a instructor/student
    I want to view my progress history
    such that I know the history of my past work
  
    Background: I am on the team-dashboard page
        Given Create team "team1"
        Given I am logged in
        And I have "iteration_1" iterations created
        And I am on the "iteration dashboard" page
        And I follow "iteration_1"
        And I follow "Edit Iteration"
        Given I create Task "customer meeting" to "meet with customer"

        When I follow "Add new task"
        And I fill in "task_title" with "create low-fi"
        And I fill in "task_description" with "mock up after the meeting"
        And I should see "customer meeting"
        And I check "tasks[customer meeting]"
        And I press "Create Task"
        And I follow "Publish tasks"
        And I follow "Logout"

        Given I am logged in as "team1"
        And I finish task "customer meeting"
        And I follow "Logout"

    Scenario: Instructor can see student status history
        Given I am logged in
        And I follow "team1"
        Then I should see "Progress History"
        And I should see "custimer meeting finished"

    Scenario: Student can see student status history
        Given I am logged in as "team1"
        Then I should see "Progress History"
        And I should see "custimer meeting finished"

