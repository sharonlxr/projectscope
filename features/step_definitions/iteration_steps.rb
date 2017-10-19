Then(/^I have "(.*)" iterations created$/) do |arg1|
  if arg1 =~ /\A\d+\z/ #if the arg is a number (always a string but we'll convert it)
    arg1.to_i.times do |num|
      Iteration.create!(:name => "iteration #{num}", :start => Date.new(1997, 1, 3), :end => Date.new(2017,10,17))
    end
  else
    arr = arg1.split
    arr.each do |name|
      Iteration.create!(:name => name, :start => Date.new(1997, 1, 3), :end => Date.new(2017,10,17))
    end
  end
end

Then(/^I should see "(.*)" iterations$/) do |arg1|
  arg1.to_i.times do |num|
    expect(page).to have_selector(:css, "a[href='#{edit_iteration_path(num + 1)}']" )
  end 
end

Then(/^I should see the "(.*)" link/) do |link_name|
  
  page.should have_link(link_name)
end

Then(/^I should see the "(.*)" button/) do |button_name|
  page.should have_button(button_name)
end