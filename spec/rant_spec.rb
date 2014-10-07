require "rails_helper"

feature "User can rant" do
  # scenario "User can create rant" do
  #   login
  #   fill_in "rant_topic", :with => "rant"
  #   fill_in "Rant", :with => "something awesome is happening. something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening."
  # end
  #
  # scenario "User rants unsuccessfully" do
  #   login
  #   click_on "RANT"
  #   expect(page).to have_content "Topic can't be blank"
  #   expect(page).to have_content "Rant can't be blank"
  # end

  scenario "User can delete a rant that they've created" do
    create_rant(1, "rant", 1)
    login
    expect(page).to have_content "exampleexampleexampleexampleexampleexamplexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexampleexample"
    click_on "Delete"
    expect(page).to_not have_content "rant about topic rant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topic"
    expect(page).to have_content "Rant was deleted successfully"
  end

  scenario "User can view rants created by other users" do
    login
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
    expect(page).to have_content "rant about topic rant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topic"

    #user can follow other users

    click_on "follow"
    expect(page).to have_content "unfollow"

    click_on "unfollow"
    expect(page).not_to have_content "unfollow"

    #user can view the people they are following under the Following page

    click_on "follow"

    within('#navbar-links') do
      click_on "Following"
    end

    expect(page).to have_content "Jessica"

    #user can favorite and unfavorite a rant on the rants index page
    visit "/"

    click_on "Favorite"
    expect(page).to have_content "Unfavorite"

    click_on "Unfavorite"
    expect(page).not_to have_content "Unfavorite"

    #user can click on a rant and view that rant

    visit '/'

    click_on "rant about topic"
    expect(page).to have_content "rant about topic rant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topic"


    #user can favorite a rant

    click_on "Favorite"
    expect(page).to have_content "Unfavorite"

    click_on "Dashboard"
    click_on "rant about topic"
    expect(page).to have_content "Unfavorite"

    #user can unfavorite a rant

    click_on "Unfavorite"
    find_button "Favorite"

    click_on "Dashboard"
    click_on "rant about topic"
    expect(page).not_to have_content "Unfavorite"


    #user can click on another user's name and view their profile

    visit "/"

    click_on "Jessica"
    expect(page).to have_content "Jessica"

    #when user click's on another user's profile, user can favorite and unfavorite their rants

    click_on "Favorite"
    visit "/"
    click_on "Jessica"
    expect(page).not_to have_content "Favorite"

    #user can click on dashboard and be redirected to the root path

    visit "/"
    click_on "Dashboard"

    expect(page).to have_content "My Rants"
  end
end
