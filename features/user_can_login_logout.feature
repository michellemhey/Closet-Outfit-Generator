Feature: Users can login and logout
  In order to save my clothes
  As a user
  I want to login

  Scenario: Happy Path
    Given the user "bob@example.com" with password "password"
    When I go to the homepage
    And I click "Login"
    And I fill in "bob@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
    And I should not see "Login"

  Scenario: Wrong Password
    Given the user "bob@example.com" with password "password"
    When I go to the homepage
    And I click "Login"
    And I fill in "bob@example.com" for "Email"
    And I fill in "pasword" for "Password"
    And I press "Sign in"
    Then I should see "Invalid email or password."

  Scenario: Wrong Username
    Given the user "bob@example.com" with password "password"
    When I go to the homepage
    And I click "Login"
    And I fill in "joe@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Sign in"
    Then I should see "Invalid email or password."