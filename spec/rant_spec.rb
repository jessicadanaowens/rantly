require "rails_helper"

feature "User can rant" do
  scenario "User can create rant" do
    create_rant
  end

  scenario "User can delete a rant that they've created" do
    create_rant
    click_on "Delete"
    expect(page).to_not have_content "rant about topic"
    expect(page).to have_content "Rant was deleted successfully"
  end

  scenario "User can view rants created by other users" do
    create_rant

    click_on "LOGOUT"

    visit homepage_path

    click_on "Join"
    fill_in "Username", :with => "Blake"
    fill_in "First name", :with => "Blake"
    fill_in "Last name", :with => "Calderwood"
    fill_in "Bio", :with => "yo!"
    fill_in "Password", :with => "password"
    within("#frequency-of-rants-form") do
      choose "user_frequency_daily"
    end
    click_on "Register"

    within('#navbar-links') do
      click_on "Login"
    end

    fill_in "Username", :with => "Blake"
    fill_in "Password", :with => "password"

    within('#login-button') do
      click_on "Login"
    end

    expect(page).to have_content "Latest Rants"
    expect(page).to have_content "rant about topic"
  end
end



def create_rant
  login

  fill_in "Topic", :with => "topic"
  fill_in "Rant", :with => "rant about topic"

  click_on "RANT"
  expect(page).to have_content "My Rants"
  within('#my-rants-container') do
    expect(page).to have_content "rant about topic"
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