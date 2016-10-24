# == Schema Information
#
# Table name: authorized_users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#

class AuthorizedUser < ActiveRecord::Base
  validates_format_of :email,:with => Devise::email_regexp
  
  def self.has_email?(email)
    if self.find_by_email(email).nil?
      return false
    else
      return true
    end
  end
end
