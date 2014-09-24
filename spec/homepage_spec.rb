require "rails_helper"

feature "User is on the homepage" do
  scenario "and sees a banner" do

    visit homepage_path

    expect(page).to have_content("Rantly")
    expect(page).to have_content("Login Join")
  end

  scenario "an anonymous user sees a welcome back message when they revisit the homepage" do
    visit homepage_path

    click_on "Login"
    click_on "Rant.ly"

    expect(page).to have_content "Welcome Back"
  end
end