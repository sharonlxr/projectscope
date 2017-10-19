Given(/^I am under "([^"]*)"$/) do |page|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a link to "([^"]*)"$/) do |web|
  steps %Q{ I should see the "#{web}" link}
   # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be redirect to dashboard page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" under "([^"]*)"$/) do |content, tag|
  pending # Write code here that turns the phrase above into concrete actions
end


Given(/^I check "([^"]*)" as parents$/) do |parent_task|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I select "([^"]*)" and press edit$/) do |task|
  pending # Write code here that turns the phrase above into concrete actions
end

Given (/^I create Task "([^"]*)" to "([^"]*)"$/) do |title, description|
  iter = Iteration.find_by_name("iteration_1")
  t1 = Task.new
  t1.iteration=iter
  t1.title=title
  t1.description=description
  t1.save
  # pending
end

# And (/^I  am on Iteration "([^"]*)"$/) do |iter|
#   steps %Q{
#     And I have "iteration_1, iteration_2" iterations created
#     And I am on the "iteration dashboard" page
#     Then I should see the "iteration_1" link
#     When I follow "iteration_1"
#   }
# end