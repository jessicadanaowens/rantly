require "rails_helper"

def create_user
  User.create(:username => "Blake", :first_name => "Blake", :last_name => "Calderwood", :bio => "I love to draw!", :password => "password", :frequency => "daily", :email => "Blake@gmail.com", :avatar => File.new(Rails.root + 'spec/photos/room.png'))
end

def create_another_rant(user)
  Rant.create(:topic=>"another rant", :rant=>"another rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rant", :user_id=> user.id)
end

def create_rant
  fill_in "rant_topic", :with => "rant"
  fill_in "rant_rant", :with => "something awesome is happening. something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening."
  click_on "RANT"
end