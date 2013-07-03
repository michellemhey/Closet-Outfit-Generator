Feature: User can delete clothes
  In order to remove pieces of clothing from a closet
  As a user
  I want to be able to delete clothes

  Scenario: Happy Path
    Given the user "bob@example.com" with password "password"
    Given the piece of clothing "Jeans" has been created
    When I go to the homepage
    And I log in as "bob@example.com" with password "password"
    And I click the link "Clothing List"
    And I click the link "Boots"
    And I click the button "delete"
    Then I should not see "Boots"