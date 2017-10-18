Feature: add a new iteration

  As an instructor
  So that I can create a new, empty, iteration task list
  I want to add an iteration and specify it's name 
  
  Scenario: see iterations page
    Given I am logged in
    And I am on the "instructor dashboard" page
    Then I should see the "Iterations" link
    And I follow "Iterations"
    Then I should be on the "iteration dashboard" page

  Scenario: create a new iteration
    Given I am logged in
    And I am on the "iteration dashboard" page
    Then I should see the "New Iteration" button
    And I press "New Iteration"
    Then I should be on the "edit iteration index 1" page
    Then I should see the "Save Iteration" link
    And I follow "Save Iteration"
    Then I should be on the "iteration dashboard" page
  
  Scenario: view an iteration I've created
    Given I am logged in
    And I have "3" iterations created
    And I am on the "iteration dashboard" page
    Then I should see "3" iterations
    
  Scenario: I can edit an existing iteration
    Given I am logged in
    And I have "iteration_1, iteration_2" iterations created
    And I am on the "iteration dashboard" page
    Then I should see the "iteration_1" link
    When I follow "iteration_1"
    Then I should be on the "iteration_1 edit" page
  
  @wip
  Scenario: I can add a start date, end date, and title to an iteration
    Given I am logged in
    And I am on the "create new iteration" page
    And I fill in "iteration title" with "iter title"
    And I fill in "start date" with "01/03/2017"
    And I fill in "end date" with "01/10/2017"
    And I press "save iteration"
    Then I should see "iter title, 01/03/2017, 01/10/2017"
    
  @wip
  Scenario: I see no iterations before any created
    Given I am on the "iteration dashboard" page
    Then I should not see "iteration"