When(/^I go to the homepage$/) do
  visit "/"
end

When(/^I click "(.*?)"$/) do |text|
  click_link_or_button text
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |value, field_named|
  fill_in field_named, with: value
end

Then "show me the page" do
  save_and_open_page
end

When(/^I press "(.*?)"$/) do |button|
  click_button(button)
end

Then(/^I should be able to log back in as "(.*?)" with password "(.*?)"$/) do |arg1, arg2|
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content(content)
end

