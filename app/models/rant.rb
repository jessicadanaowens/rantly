class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorite_rants
  has_many :comments

  validates_presence_of :topic, :rant, :user_id
  validates_length_of :topic, :maximum => 50, :message => "Title must be less than 50 characters"
  validates_length_of :rant, :minimum => 140, :message => "Body must be greater than 140 characters"

  def self.sort_by_favorites(rants)
    rants.sort_by do |rant|
      FavoriteRant.where(:rant_id => rant.id).length
    end
  end

  def self.search_topic(search)
    if search
      where('topic LIKE ?', "%#{search}%")
    end
  end

  def self.search_rant(search)
    if search
      where('rant LIKE ?', "%#{search}%")
    end
  end



end