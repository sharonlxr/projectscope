# == Schema Information
#
# Table name: Authorized_users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  role                   :string           default("coach"), not null
#

class Authorized_user < ActiveRecord::Base

  ADMIN = "admin"
  COACH = "coach"

  def self.has_email?(email)
    if self.find_by_email(email).nil?
      return false
    else
      return true
    end
  end

  def is_admin?
  	self.role == ADMIN
  end
end
