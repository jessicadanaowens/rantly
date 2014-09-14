require "rails_helper"

feature "User can login" do
  scenario "Successfully" do

    register

    within('#navbar-links') do
      click_on "Login"
    end

    fill_in "Username", :with => "Jessica"
    fill_in "Password", :with => "password"

    within('#login-button') do
      click_on "Login"
    end

    expect(page).to have_content "Welcome"
    expect(page).to have_content "Jessica"
  end

  scenario "User can log out" do
    register

    within('#navbar-links') do
      click_on "Login"
    end

    fill_in "Username", :with => "Jessica"
    fill_in "Password", :with => "password"

    within('#login-button') do
      click_on "Login"
    end

    click_on "LOGOUT"
    expect(page).to have_content "Thank you for visiting"
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
end

