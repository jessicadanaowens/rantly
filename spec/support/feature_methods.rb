require "pry-byebug"
require "rails_helper"

def signin
  create_user
  visit "/"
  click_on "Login"

end

def login
  create_user
  visit "/"
  click_on "Login"
  fill_in "Username", :with => "Jessica"
  fill_in "Password", :with => "password"
  click_on "LOGIN"
  expect(page).to have_content "Welcome"
end