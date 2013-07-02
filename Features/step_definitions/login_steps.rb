Given /^I am logged into plmtest as user "([^"]*)"$/ do |user|
  @plms.login_page.sign_in_as user, "prof7763"
  @plms.home_page.logged_in_username.should eq "Logged in as prof_verify manager"
end

When /^I go to administration tab$/ do
  @plms.home_page.go_to_admin_page
end

When /^I logout$/ do
  @plms.home_page.log_out
end