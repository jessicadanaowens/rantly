class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  accepts_nested_attributes_for :rants
  validates :username, :password, :first_name, :last_name, :bio, :frequency, presence: true
end