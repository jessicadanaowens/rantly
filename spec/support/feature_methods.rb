require "rails_helper"

def register
  visit '/home'

  click_on "Join"
  fill_in "Username", :with => "Jessica"
  fill_in "First name", :with => "Jessica"
  fill_in "Last name", :with => "Owens"
  fill_in "Bio", :with => "I love to draw!"
  fill_in "Password", :with => "password"
  fill_in "Email", :with => "jessica@gmail.com"
  within(".radio-flex-container") do
    choose "user_frequency_daily"
  end
  attach_file('user_avatar', Rails.root + 'spec/photos/room.png')
  page.find('.register-button-flex').click
end

def login
  visit "/home"
  click_on "Login"

  fill_in "Username", :with => "Jessica"
  fill_in "Password", :with => "password"
  click_on "LOGIN"
end