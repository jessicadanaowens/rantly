class InterestingRanter < ActiveRecord::Base
  belongs_to :user
  belongs_to :ranter, :class_name => User

  validates_presence_of :user_id, :ranter_id

end