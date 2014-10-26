require "rails_helper"

feature "User can follow other users", :js do
  scenario "by clicking follow on the dashboard page" do
    user = create_user
    rant = create_another_rant(user)

    register
    login
    click_on "Follow"

  end

  scenario "User can unfollow another user" do
    user = create_user
    create_another_rant(user)

    register
    login

    click_on "Follow"
    click_on "Unfollow"
    expect(page).to have_content "Follow"
  end

  scenario "User can see everyone they are following" do
    user = create_user
    create_another_rant(user)

    register
    login

    click_on "Follow"
    click_on "Following"

    expect(page).to have_content("Blake Calderwood")
  end

  scenario "User can unfollow a user from the following page" do
    user = create_user
    create_another_rant(user)

    register
    login

    click_on "Follow"
    click_on "Following"
    click_on "Unfollow"

    click_on "Following"
    expect(page).to_not have_content("Blake Calderwood")
  end
end

