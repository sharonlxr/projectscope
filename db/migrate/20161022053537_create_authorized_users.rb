class CreateAuthorizedUsers < ActiveRecord::Migration
  def change
    create_table :authorized_users, :force => true  do |t|
      t.string :email                  # default: "",      null: false
    end
    add_index :authorized_users, :email
  end
end

