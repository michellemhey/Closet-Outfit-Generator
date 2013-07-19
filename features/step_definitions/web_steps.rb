When(/^I go to the homepage$/) do
  visit "/"
end

When(/^I click "(.*?)"$/) do |text|
  click_link_or_button text
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |value, field_named|
  fill_in field_named, with: value
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, name|
  fill_in field, with: name 
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

Given(/^the user "(.*?)" with password "(.*?)"$/) do |email, password|
  user = User.create( email: email, password: password )
  refute user.new_record?
end

Then(/^I should not see "(.*?)"$/) do |content|
  page.should_not have_content(content)
end

When(/^I click "(.*?)" radio button$/) do |button|  
end

Then(/^I should see the "(.*?)" radio button selected$/) do |arg1|
end

Given(/^the piece of clothing "(.*?)" has been created$/) do |name|
  clothing = Clothing.create( name: name)
end

When(/^I log in as "(.*?)" with password "(.*?)"$/) do |email, password|
  click_link_or_button "Login"
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_link_or_button "Sign in"
end

When(/^I click the link "(.*?)"$/) do |link|
  click_link_or_button "Clothing List"
end

When(/^I click the button "(.*?)"$/) do |clothing_name|
  clothing = Clothing.find_by_name(clothing_name)
  clothing ||= Clothing.where(:name => clothing_name).first 
  clothing.destroy unless clothing.nil?
end