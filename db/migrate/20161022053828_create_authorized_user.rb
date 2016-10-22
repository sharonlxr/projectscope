class CreateAuthorizedUser < ActiveRecord::Migration
  def up
  	Authorized_user.create!(email: Figaro.env.root_user_email, role: "admin")
  	Authorized_user.create!(email: "test@berkeley.edu", role: "coach")
  end
  
  def down
  	user = Authorized_user.find_by_email(Figaro.env.root_user_email)
  	user.destroy
  end
end
