class CreateAuthorizedUser < ActiveRecord::Migration
  def up
  	AuthorizedUser.create!(email: Figaro.env.root_user_email)
  end
  
  def down
  	user = AuthorizedUser.find_by_email(Figaro.env.root_user_email)
  	user.destroy
  end
end
