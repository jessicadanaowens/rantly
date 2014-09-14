class User < ActiveRecord::Base
  has_secure_password
  validates :username, :password, :first_name, :last_name, :bio, :frequency, presence: true
end