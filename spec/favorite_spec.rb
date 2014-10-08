require "rails_helper"

feature "User can favorite a rant", :js=>true do
  scenario "User can favorite a rant by clicking favorite on the dashboard" do
    user = create_user
    create_another_rant(user)

    register
    login

    click_on "Favorite"

  end

  scenario "User can unfavorite a rant on the dashboard" do
    user = create_user
    create_another_rant(user)

    register
    login

    click_on "Favorite"
    click_on "Unfavorite"
  end

  scenario "User can view favorite rants on the Favorite page" do
    user = create_user
    create_another_rant(user)

    register
    login

    click_on "Favorite"
    click_on "Favorites"

    expect(page).to have_content("another rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rant")
    expect(page).to have_content("Blake")
  end

  scenario "User can unfavorite a rant on the favorites page" do
    user = create_user
    create_another_rant(user)

    register
    login

    click_on "Favorite"
    click_on "Favorites"
    click_on "Unfavorite"

    click_on "Favorites"
    expect(page).to_not have_content("another rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rant")

  end

  scenario "User can follow a ranter from the favorites page" do
    user = create_user
    create_another_rant(user)

    register
    login

    click_on "Favorite"
    click_on "Favorites"
    click_on "Follow"

    click_on "Dashboard"
    click_on "Unfollow"

  end

  scenario "User can unfollow a ranter from the favorites page" do
    user = create_user
    create_another_rant(user)

    register
    login

    click_on "Favorite"
    click_on "Favorites"
    click_on "Follow"
    click_on "Unfollow"

    click_on "Dashboard"
    click_on "Follow"
  end

  scenario "User can see a ranter's profile from the favorites page" do
    user = create_user
    create_another_rant(user)

    register
    login

    click_on "Favorite"
    click_on "Favorites"
    click_on "Blake"

    expect(page).to have_content("another rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rant")
  end
end