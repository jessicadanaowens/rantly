require "rails_helper"

feature "User Auth" do
  scenario "User registers unsuccessfully" do
   visit root_url

    click_on "Join"
    fill_in "Username", :with => ""
    fill_in "First name", :with => "Jessica"
    fill_in "Last name", :with => "Owens"
    fill_in "Bio", :with => "I love to draw!"
    fill_in "Password", :with => "password"
    within("#frequency-of-rants-form") do
      choose "user_frequency_daily"
    end
    click_on "Register"
    expect(page).to have_content "Username can't be blank"
  end

  scenario "User registers successfully" do
    register
    expect(page).to have_content "Thank you for registering"
  end

  scenario "User can login" do
    login

    expect(page).to have_content "Welcome"
    expect(page).to have_content "Jessica Owens"
  end

  scenario "User can logout" do
    login
    click_on "LOGOUT"
    expect(page).to have_content "Thank you for visiting"
  end

  scenario "User can edit profile" do

    login

    click_on "Jessica Owens"

    expect(page).to have_content("Edit Profile")
    expect(page).to have_content "Bio"
    click_on "Update"

    expect(page).to have_content "Password can't be blank"
    fill_in "Password", :with => "password"
    click_on "Update"
    expect(page).to have_content "Your profile was updated successfully"
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
end

