Feature: Visiting Homepage

Scenario: New User Visits Homepage
  Given I go to the home page
  Then I should see "Home"
  And I click "Sign in"
  Then I should see "Sign in"