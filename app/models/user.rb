class User < ActiveRecord::Base
  include Concerns::Following

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_secure_password
  has_many :rants
  has_many :interesting_ranters
  has_many :favorite_rants
  accepts_nested_attributes_for :rants

  validates :username, :first_name, :last_name, :bio, :frequency, :avatar, presence: true
  validates :password, length: { minimum: 5 }

  def self.search_last_name(search)
    if search
      where('last_name LIKE ?', "%#{search}%")
    end
  end

  def self.search_first_name(search)
    if search
      where('first_name LIKE ?', "%#{search}%")
    end
  end

  def self.search_username(search)
    if search
      where('username LIKE ?', "%#{search}%")
    end
  end





end