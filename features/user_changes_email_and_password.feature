Feature: User changes email and password

	Scenario: Email happy path
		Given I am logged in as "bob@example.com" with password "password"
		When I go to the homepage
		And I click "Settings"
		And I fill in "Email" with "robert@example.com"
		And I fill in "Current password" with "password"
		And I press "Save"
		Then I should see "Your profile has been saved"
		When I log out
		Then I should be able to log back in as "robert@example.com" with password "password"

	Scenario: Invalid email
		Given I am logged in as "bob@example.com" with password "password"
		When I go to the homepage
		And I click "Settings"
		And I fill in "Email" with "robertexample.com"
		And I press "Save"
		Then I should see "Email is invalid"

	Scenario: Password happy path
		Given I am logged in as "bob@example.com" with password "password"
		When I go to the homepage
		And I click "Settings"
		And I fill in "Current password" with "password"
		And I fill in "New Password" with "password1"
		And I press "Save"
		Then I should see "Your profile has been saved"
		When I log out
		Then I should be able to log back in as "bob@example.com" with password "password1"