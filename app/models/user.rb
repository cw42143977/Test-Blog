# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  username        :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  extend FriendlyId

  friendly_id :username

  attr_accessible :name, :username, :email, :password, :password_confirmation
  has_secure_password

  validates :name,      presence: true,
                        length: { maximum: 40 }
  validates :username,  presence: true,
                        length: { maximum: 40 },
                        uniqueness: { case_sensitive: false }
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,     presence: true, 
                        format: { with: valid_email_regex },
                        uniqueness: { case_sensitive: false }
  validates :password,  length: { minimum: 8 }

end
