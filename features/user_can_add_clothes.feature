Feature: User can add clothes
  In order to have clothes in the closet
  As a user
  I want to add clothes

  Scenario: Add Clothing
    Given the user "bob@example.com" with password "password"
    When I go to the homepage
    And I click "Login"
    And I fill in "bob@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Sign in"
    And I click "Add Clothing"
    And I fill in "Clothing Name" with "Jeans"
    And I fill in "Clothing Description" with "Pants"
    And I click "Bottom" radio button
    And I press "Add Clothing"