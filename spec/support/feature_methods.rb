require "pry-byebug"
require "rails_helper"


# def register
#   visit homepage_path
#
#   click_on "Join"
#   fill_in "Username", :with => "Jessica"
#   fill_in "First name", :with => "Jessica"
#   fill_in "Last name", :with => "Owens"
#   fill_in "Bio", :with => "I love to draw!"
#   fill_in "Password", :with => "password"
#   within(".radio-flex-container") do
#
#     choose "user_rant_frequency_daily"
#   end
#   click_on "Register"
# end

def signin
  create_user
end

def login
  create_user
  visit "/signin"
  fill_in "Username", :with => "Jessica"
  fill_in "Password", :with => "password"
  click_on "LOGIN"
  byebug

end