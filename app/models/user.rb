class User < ActiveRecord::Base
  include Concerns::Following

  has_secure_password
  has_many :rants
  has_many :interesting_ranters
  has_many :favorite_rants
  accepts_nested_attributes_for :rants

  validates :username, :first_name, :last_name, :bio, :frequency, presence: true
  validates :password, length: { minimum: 5 }

  def self.search(search)
    if search
      where('last_name LIKE ?', "%#{search}%")
    end
  end


end