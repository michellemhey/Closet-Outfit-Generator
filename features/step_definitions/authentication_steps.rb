Given(/^the user "(.*?)" with password "(.*?)"$/) do |email, password|
  user = User.create( email: email, password: password)
  refute user.new_record?
end

Then(/^I (?:should be able to log back in as|am logged in as)? "(.*?)" with password "(.*?)"$/) do |email, password|
  User.create( email: email, password: password) unless User.find_by_email(email)
  visit new_user_session_path
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button "Sign in"
  page.should have_content("You are now signed in.")
end

Given "I am logged in" do
  @user = Fabricate(:user, email: "joe@example.com")
  visit new_user_session_path
  fill_in "Email", with: "joe@example.com"
  fill_in "Password", with: "password"
  click_button "Sign in"
  page.should have_content("You are now signed in.")
end

When "I log out" do
  click_link "Sign Out"
end