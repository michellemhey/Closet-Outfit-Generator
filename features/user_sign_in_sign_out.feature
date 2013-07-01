Feature: Users can signs in and signs out
	In order to save my pieces of clothing
	As a user
	I want to sign in

	Scenario: Happy Path
		Given the user "bob@example.com" with password "password1"
		When I go to the homepage
		And I click "Sign in"
		And I fill in "bob@example.com" for "Email"
		And I fill in "password1" for "Password"
		And I press "Sign in"
		Then I should see "You are now signed in."
		And I should not see "Sign In"

	Scenario: Wrong Password
		Given the user "bob@example.com" with password "password1"
		When I go to the homepage
		And I click "Sign In"
		And I fill in "bob@example.com" for "Email"
		And I fill in "wrong password" for "Password"
		And I press "Sign in"
		Then I should see "Your username or password is incorrect. Please try again."

	Scenario: Wrong Username
		Given the user "bob@example.com" with password "password1"
		When I go to the homepage
		And I click "Sign In"
		And I fill in "betty@example.com" for "Email"
		And I fill in "password1" for "Password"
		And I press "Sign in"
		Then I should see "Your username or password is incorrect. Please try again."

	Scenario: User signs out
		Given I am logged in
		When I press "Sign Out"
		Then I should see "You are now signed out."