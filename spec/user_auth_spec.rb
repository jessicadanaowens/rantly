require "rails_helper"

feature "User Auth" do
  scenario "User registers unsuccessfully", :js => true do
    visit '/home'

    click_on "Join"
    fill_in "Username", :with => ""
    fill_in "First name", :with => "Jessica"
    fill_in "Last name", :with => "Owens"
    fill_in "Bio", :with => "I love to draw!"
    fill_in "Password", :with => "password"
    within(".radio-flex-container") do
      choose "user_frequency_daily"
    end
    page.find('.register-button-flex').click
    expect(page).to have_content "Username can't be blank"
  end

  scenario "User registers successfully", :js => true do
  register

  end

  scenario "User can login", :js => true do
    register
    login

    expect(page).to have_content "Welcome"
    expect(page).to have_content "Jessica Owens"
  end

  scenario "User can logout", :js=>true do
    register
    login
    click_on "LOGOUT"
    expect(page).to have_content "Thank you for visiting"
  end

  scenario "User can edit profile", :js=>true do
    register
    login

    click_on "Jessica Owens"

    expect(page).to have_content("Edit Profile")
    expect(page).to have_content "Bio"

    fill_in "Password", :with => "password"
    click_on "Update"
    expect(page).to have_content "Your profile was updated successfully"
  end
end

