Given /^I have (.*)$/ do |body, table|
  assert @user
  step "that user has #{body}", table
end

Given(/^"(.*?)" has (.*)$/) do |email, body, table|
  @user = User.find_by_email(email) || Fabricate(:user, email: email)
  step "that user has #{body}", table
end