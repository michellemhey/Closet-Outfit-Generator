Feature: User adds clothing

	Scenario: Happy Path
		Given I am logged in
		And I have the following pieces of clothing:
			| name        |
			| Blue Jeans  |
			| Black Dress |
		When I go to the clothings page
		And I fill in "Clothing Name" with "Pink Shirt"
		And I press "Add Clothing"
		Then I should see "Pink Shirt has been added to your clothing list"
		And I should see the following list:
			| Blue Jeans  |
			| Black Dress |
			| Pink Shirt  |

	Scenario: Duplicate Clothing Name
		Given I am logged in
		And I have the following pieces of clothing:
			| name        |
			| Blue Jeans  |
			| Black Dress |
		When I go to the clothings page
		And I fill in "Clothing Name" with "Black Dress"
		And I press "Add Clothing"
		Then I should see "Name must be unique"

	Scenario: Blank Name
		Given I am logged in
		When I go to the clothings page
		And I fill in "Clothing Name" with ""
		And I press "Add Clothing"
		Then I should see "Name can't be blank"