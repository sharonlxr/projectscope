# Feature: add a new iteration

#   As an instructor
#   So that I can create a new, empty, iteration task list
#   I want to add an iteration and specify it's name 
  
#   Scenario: see iterations page
#     Given I am logged in
#     And I am on the "instructor dashboard" page
#     Then I should see the "iteration dashboard" button
#     And I press "iteration dashboard"
#     Then I should be on the "iteration dashboard" page
  
#   Scenario: create a new iteration
#     Given I am logged in
#     And I am on the "iteration dashboard" page
#     Then I should see the "create new iteration" button
#     And I press "create new iteration"
#     Then I should be on the new iteration page
#     Then I should see the "save iteration" button
#     And I press "save iteration"
#     Then I should be on the "iteration dashboard" page
    
#   Scenario: view an iteration I've created
#     Given I am logged in
#     And I have "3" iterations created
#     And I am on the "iteration dashboard" page
#     Then I should see "3" iterations
    
#   Scenario: I can edit an existing iteration
#     Given I am logged in
#     And I am on the "iteration dashboard" page
#     And I have "iteration_1, iteration_2" iterations created
#     Then I should see "iteration_1" button
#     When I press "iteration_1"
#     Then I should be on the "iteration_1 edit" page
    
#   Scenario: I can add a start date, end date, and title to an iteration
#     Given I am logged in
#     And I am on the "create new iteration" page
#     And I fill in "iteration title" with "iter title"
#     And I fill in "start date" with "01/03/2017"
#     And I fill in "end date" with "01/10/2017"
#     And I press "save iteration"
#     Then I should see "iter title, 01/03/2017, 01/10/2017"
    
#   Scenario: I see no iterations before any created
#     Given I am on the "iteration dashboard" page
#     Then I should not see "iteration"