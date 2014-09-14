require "rails_helper"

feature "User is on the homepage" do
  scenario "and sees a banner" do

    visit homepage_path

    expect(page).to have_content("Rantly")
    expect(page).to have_content("Login Join")
  end
end