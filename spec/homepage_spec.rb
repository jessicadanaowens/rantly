require "rails_helper"

feature "User is on the homepage" do
  scenario "and sees a banner" do

    visit root_url

    expect(page).to have_content("Rantly")
  end
end