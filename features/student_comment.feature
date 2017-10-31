Feature: students can comment 

  As an student, 
  So that I can pass context about metrics to Instructors and teammates
  I want to be able to add comments (new comment threads) to metrics
  
Background: users and project in the data base
  
  Given the following projects exist:
  | name      |
  | Project_1 |
  | Project_2 |

  Given the following metrics exist:
  | metric_name  | project   | score |
  | code_climate | Project_1 | 2     |
  | github       | Project_1 | 3     |

  Given the following users exist:
  | provider_username       | uid         | email                 | provider  | role    | project   |
  | Admin                   | uadmin      | uadmin@example.com    | developer | admin   | Project_1 |
  | Student                 | ustudent    | ustudent@example.com  | developer | student | Project_1 |
  | Student2                | ustudent2   | ustudent2@example.com | developer | student | Project_2 |

#this feature is alrady implimented, so the test is a sanity check on testing apparatus
Scenario: add new comment as admin
  Given I am "uadmin" and logged in
  And I am on the "view project 'Project_1'" page
  And I follow "Code Climate"
  Then I should see "Submit"
  And I fill in "content" with "this is an admina comment"
  And I press "Submit"
  And I follow "Project_1"
  Then I should see "this is an admina comment"

Scenario: add new comment as student
  Given I am "ustudent" and logged in
  And I am on the "view project 'Project_1'" page
  And I follow "Code Climate"
  Then I should see "Submit"
  And I fill in "content" with "this is a studenta comment"
  And I press "Submit"
  #if user is a student, we are redirected from projects#index to our users project page, so we don't need to click on the link 
  #like we did for the admin 
  Then I should see "this is a studenta comment"
  
Scenario: can't add comment if student of different project
  Given I am "ustudent2" and logged in
  And I am on the "view project 'Project_1'" page
  And I follow "Code Climate"
  Then I should not see "Submit"
  
Scenario: see reply to metric comment as student
  Given I am "ustudent" and logged in
  And there is a "uadmin" comment "ad com" on project "Project_1" metric "code_climate"
  And I am on the "view project 'Project_1'" page
  Then I should see "reply"
  
Scenario: reply to a comment as a student
  Given I am "ustudent" and logged in
  And there is a "uadmin" comment "ad com" on project "Project_1" metric "code_climate"
  And I am on the "view project 'Project_1'" page
  Then I should see "ad com"
  And I should see "reply"
  And I press "reply"
  And I fill in "comment" with "this is a student reply"
  And I press "submit"
  And I follow "Project_1"
  Then I should see "ad com"
  And I should see "this is a student reply"