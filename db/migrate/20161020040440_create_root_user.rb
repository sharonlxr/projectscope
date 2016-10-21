class CreateRootUser < ActiveRecord::Migration
  def self.up
  	User.create!(email: Figaro.env.root_user_email, password: Figaro.env.root_user_password, role: "admin")
  end

  def self.down
  	user = User.find_by_email(Figaro.env.root_user_email)
  	user.destroy
  end
end
