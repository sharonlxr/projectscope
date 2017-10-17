Then(/^I have "(.*)" iterations created$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "(.*)" iterations$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the "(.*)" link/) do |link_name|
  page.should have_link(link_name)
end