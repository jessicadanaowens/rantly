require "rails_helper"

feature "User can login" do
  scenario "Successfully" do

    register

    click_on "Login"
    fill_in "Username", :with => "Jessica"
    fill_in "Password", :with => "password"
    click_on "Login"

    expect(page).to have_content "Welcome"
  end

  def register
    visit root_url

    click_on "Join"
    fill_in "Username", :with => "Jessica"
    fill_in "Email", :with => "jessica@gmail.com"
    fill_in "Password", :with => "password"
    click_on "Register"
  end
end