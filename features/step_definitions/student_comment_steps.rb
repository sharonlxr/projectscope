Given(/the following users exist:/) do |users_table|
  users_table.hashes.each do |user|
    user["password"] = Devise.friendly_token[0,20]
    user["preferred_metrics"] = []
    user["preferred_projects"] = []
    user["project"] = Project.find user["project"].to_i
    if user["role"] == "student"
      user["role"] = User::STUDENT
    elsif user["role"] == "admin"
      user["role"] = User::ADMIN
    end
    User.create user
  end
end

Given(/the following metrics exist:/) do |metrics_table|

  metrics_table.hashes.each do |metric|
    m = MetricSample.create!(:metric_name => metric["metric_name"],
                             :project_id => Project.find_by(name: metric["project"]).id,
                             :score => 3,
                             :image => File.read('./db/fake_data/slack2.json'),
                             :created_at => Date.new(1997,1,3))
    Config.create(:metric_name => metric["name"],
                  :project_id => Project.find_by(name: metric["project"]).id,
                  :token => (0...50).map { ('a'..'z').to_a[rand(26)] }.join)
  end

end

Given(/I am a "(.*)" logged in/) do |type|
  num = User.count
  if type == "student"
    student_user = User.create!(provider_username: "Student#{num}", uid: "ustudent#{num}", email: "ustudent#{num}@example.com",
                              provider: "developer", role: User::STUDENT, password: Devise.friendly_token[0,20])
    ENV['STUDENT_PASSWORD'] = 'password'
    visit "/login/#{student_user.uid}?passwd=password"
  elsif type == "admin"
    admin_user = User.create!(provider_username: "Admin#{num}", uid: "uadmin#{num}", email: "uadmin#{num}@example.com",
                              provider: "developer", role: User::ADMIN, password: Devise.friendly_token[0,20])
    ENV['ADMIN_PASSWORD'] = 'password'
    visit "/login/#{admin_user.uid}?passwd=password"
  else
    raise "type must be 'student' or 'admin', got '#{type}'"
  end
end

Given(/there is a "(.*)" comment "(.*)" on project "(.*)" metric "(.*)"/) do |user_type, comment, project, metric|
    pending
end

