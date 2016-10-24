class CreateNormalUser < ActiveRecord::Migration
  def up
  	User.create!(email: "test@berkeley.edu", password: "asdf1234", role: "coach")
  end

  def down
  	user = User.find_by_email("test@berkeley.edu")
  	user.destroy
  end
end
