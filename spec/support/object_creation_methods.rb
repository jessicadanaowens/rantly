require "rails_helper"

def create_rant(id, topic, user_id)
  Rant.create(:id => id, :topic => topic, :rant => "exampleexampleexampleexampleexampleexamplexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexample", :user_id => user_id)
end

def create_user
  User.create(:username => "Jessica", :first_name => "Jessica", :last_name => "Owens", :bio => "I love to draw!", :password => "password", :frequency => "daily")
end