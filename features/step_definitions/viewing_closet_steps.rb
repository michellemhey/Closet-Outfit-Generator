Given /^there is a closet called "([^\"]*)"$/ do |name|
  Factory(:closet, :name => name)
end

Given(/^I am on the homepage$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I follow "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the closet page for "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end