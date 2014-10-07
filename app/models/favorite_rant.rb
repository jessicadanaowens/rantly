class FavoriteRant < ActiveRecord::Base
  validates_presence_of :rant_id, :user_id
  belongs_to :user
  belongs_to :rant


end