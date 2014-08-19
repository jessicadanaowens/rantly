require "rails_helper"

feature "User can register" do
  scenario "successfully" do
    visit root_url

    click_on "Join"
    fill_in "Username", :with => "jessica"
    fill_in "Email", :with => "jessica@gmail.com"
    fill_in "Password", :with => "password"
    click_on "Register"

    expect(page).to have_content "Thank you for registering"
  end

  scenario "unsuccessfully" do
    visit root_url

    click_on "Join"
    fill_in "Username", :with => ""
    fill_in "Email", :with => "jessica@gmail.com"
    fill_in "Password", :with => "password"
    click_on "Register"

    expect(page).to have_content "Username can't be blank"
  end
end