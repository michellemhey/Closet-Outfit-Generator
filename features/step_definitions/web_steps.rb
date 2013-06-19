def path_to page
  case page
  when /the home\s?page/
    root_path
  when "the clothings page"
    clothings_path
  end
end

When /^I go to (.*)$/ do |page|
  visit path_to(page)
end

When "show me the page" do
  save_and_open_page
end

When(/^I (?:click|press) "(.*?)"$/) do |text|
  click_link_or_button text
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field_named, value|
  fill_in field_named, with: value
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |value, field_named|
  fill_in field_named, with: value
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content(content)
end

Then(/^I should not see "(.*?)"$/) do |content|
  page.should_not have_content(content)
end

Then(/^I should see the following list:$/) do |table|
  table.raw.each_with_index do |content, row|
    page.should have_xpath("//ul/li[#{row+1}][contains(normalize-space(.), '#{content[0]}')]")
  end
end

Then(/^I should not see any of the following:$/) do |table|
  table.raw.each do |item|
    page.should have_no_content(item[0])
  end
end