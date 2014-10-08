require "pry-byebug"
require "launchy"
require "rails_helper"

def register
  visit '/home'

  click_on "Join"
  fill_in "Username", :with => "Jessica"
  fill_in "First name", :with => "Jessica"
  fill_in "Last name", :with => "Owens"
  fill_in "Bio", :with => "I love to draw!"
  fill_in "Password", :with => "password"
  within(".radio-flex-container") do
    choose "user_frequency_daily"
  end
  page.find('.register-button-flex').click
  expect(page).to have_content "Thank you for registering"
end

def login
  visit "/home"
  click_on "Login"

  fill_in "Username", :with => "Jessica"
  fill_in "Password", :with => "password"
  click_on "LOGIN"
end