Feature: Viewing Closets
  In order to view a closet to a user
  As a user
  I want to be able to see a list of all the closets I created
  
  Scenario: Listing all closets
    Given there is a closet called "Michelle's Closet"
    And I am on the homepage
    When I follow "Michelle's Closet"
      no link with title, id or text "Michelle's Closet" found...
    Then I should be on the closet page for "Michelle's Closet"