Feature:import projects from excel file

    As a instructor
    I want to import some projects from a xlsx file
  
    Background: I am on the team-dashboard page
        Given I am logged in
    Scenario: I see a link to import
      And I should see the "Import Project" link
    Scenario: I can upload the file
      And I follow "Import Project"
      And I upload projects file
    Scenario: I can import the file
      And I follow "Import Project"
      And I upload projects file
      And I press "Import"