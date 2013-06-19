Feature: User views list of pieces of clothing

	Scenario:
		Given "bob@example.com" has the following pieces of clothing:
			| name           |
			| White Shirt    |
			| Red Pants      |
		And I am logged in
		And I have the following pieces of clothing:
			| name           |
			| Blue Dress     |
			| White Sneakers |
			| Black Pants    |
		When I go to the clothings page
		Then I should see the following list:
			| Blue Dress     |
			| White Sneakers |
			| Black Pants    |
		And I should not see any of the following:
			| White Shirt    |
			| Red Pants      |
