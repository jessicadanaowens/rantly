class Comment < ActiveRecord::Base
  has_many :rants
  has_many :users

  validates_presence_of :text
end