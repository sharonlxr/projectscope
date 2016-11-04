# == Schema Information
#
# Table name: whitelists
#
#  id       :integer          not null, primary key
#  username :string
#

class Whitelist < ActiveRecord::Base
  validates_format_of :username,:with => /\A[a-z0-9\-_]+\z/i
  
  def self.has_username?(username)
    if Whitelist.find_by_username(username).nil?
      return false
    else
      return true
    end
  end
end
