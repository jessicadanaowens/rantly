require "rails_helper"
def create_rant

  fill_in "Topic", :with => "topic"
  fill_in "Rant", :with => "rant about topic rant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topic"

  click_on "RANT"
  expect(page).to have_content "My Rants"
  within('#my-rants-container') do
    expect(page).to have_content "rant about topic rant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topic"
  end
end

def register
  visit homepage_path

  click_on "Join"
  fill_in "Username", :with => "Jessica"
  fill_in "First name", :with => "Jessica"
  fill_in "Last name", :with => "Owens"
  fill_in "Bio", :with => "I love to draw!"
  fill_in "Password", :with => "password"
  within("#frequency-of-rants-form") do
    choose "user_frequency_daily"
  end
  click_on "Register"
end

def login
  register

  within('#navbar-links') do
    click_on "Login"
  end

  fill_in "Username", :with => "Jessica"
  fill_in "Password", :with => "password"

  within('#login-button') do
    click_on "Login"
  end
end