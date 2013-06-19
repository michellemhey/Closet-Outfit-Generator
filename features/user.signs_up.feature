Feature: User signs up

	Scenario: Happy path
		When I go to the homepage
		And I click "Sign Up"
		And I fill in "bob@example.com" for "Email"
		And I fill in "password1" for "Password"
		And I press "Sign up"
		Then I should see "You have signed up successfully."
		When I press "Sign Out"
		Then I should be able to log back in as "bob@example.com" with password "password1"

	Scenario: Skipping password
		When I go to the homepage
		And I click "Sign Up"
		And I fill in "bob@example.com" for "Email"
		And I fill in "" for "Password"
		And I press "Sign up"
		Then I should see "Password can't be blank"

	Scenario: Invalid email
		When I go to the homepage
		And I click "Sign Up"
		And I fill in "bobexample.com" for "Email"
		And I fill in "password1" for "Password"
		And I press "Sign up"
		Then I should see "Email is invalid"