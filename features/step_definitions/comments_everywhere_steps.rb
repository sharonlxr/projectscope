Given(/the following iterations exist:/) do |iterations_table|
  iterations_table.hashes.each do |iteration|
    
    i = Iteration.create!(name: iteration["iteration_name"],
                          start: Date.today,
                          end: Date.tomorrow,
                          create_at: DateTime.now)
  end
end


