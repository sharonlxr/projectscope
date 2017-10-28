Feature: students can comment 

  As an student, 
  So that I can pass context about metrics to Instructors and teammates
  I want to be able to add comments (new comment threads) to metrics
  
Background: users and project in the data base

  Given the following users exist:
  | provider_username       | uid         | email               | provider  | role          | password                     | preferred_metrics | perferred_project | project |
  | Admin                   | uadmin      | uadmin@example.com  | developer | User::ADMIN   | Devise.friendly_token[0,20]  | []                | projects_list     | 1       |
  | Student                 | ustudent    | ustudent@example.com| developer | User::STUDENT | Devise.friendly_token[0,20]  | []                | projects_list     | 1       |

  Given the following projects exist:
  | name       |
  | Project_1  |
  
  Given the following metrics exist:
  | metric_name | project_id | score |
  | metric_1    | 0          | 2     | 
  | metric_2    | 1          | 2     |

Scenario: see reply to metric comment as student
  Given I am a "student" logged in
  And there is a "admin" comment "ad com" on project "Project_1" metric "metric_1"
  And I am on the "view Project_1" page
  Then I should see "reply"
  
Scenario: add new comment as student
  Given I am a "student" logged in
  And I am on the "view Project_1" page
  And I follow "metric_1"
  Then I should see "comment"
  And I fill in "comment" with "this is a student comment"
  And I press "submit"
  And I follow "Project_1"
  Then I should see "this is a student comment"
  
Scenario: reply to a comment as a student
  Given I am a "student" logged in
  And there is a "admin" comment "ad com" on project "Project_1" metric "metric_1"
  And I am on the "view Project_1" page
  Then I should see "ad com"
  And I should see "reply"
  And I press "reply"
  And I fill in "comment" with "this is a student reply"
  And I press "submit"
  And I follow "Project_1"
  Then I should see "ad com"
  And I should see "this is a student reply"