def path_to page
  case page
  when /the home\s?page/
    root_path
  when "home page"
    home_path
  end
end

Given(/^I go to the home page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I click "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end