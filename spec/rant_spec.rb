require "rails_helper"

feature "User can rant", :js do
  scenario "User can create rant" do
    register
    login

    create_rant
    expect(page).to have_content("something awesome is happening. something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening.something awesome is happening.")
  end

  scenario "User rants unsuccessfully" do
    register
    login
    click_on "RANT"
    expect(page).to have_content "Topic can't be blank"
    expect(page).to have_content "Rant can't be blank"
  end

  scenario "User can delete a rant that they've created", :js=>true do
    register
    login
    create_rant
    page.find(".delete").click
    expect(page).to_not have_content "rant about topic rant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topicrant about topic"
    expect(page).to have_content "Rant was deleted successfully"
  end
#
  scenario "User can view rants created by other users", :js=>true do
    user = create_user
    create_another_rant(user)

    register
    login
    expect(page).to have_content("another rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rant")
  end




#
#     #user can click on another user's name and view their profile
#
#     visit "/"
#
#     click_on "Jessica"
#     expect(page).to have_content "Jessica"
#
#     #when user click's on another user's profile, user can favorite and unfavorite their rants
#
#     click_on "Favorite"
#     visit "/"
#     click_on "Jessica"
#     expect(page).not_to have_content "Favorite"
#
#     #user can click on dashboard and be redirected to the root path
#
#     visit "/"
#     click_on "Dashboard"
#
#     expect(page).to have_content "My Rants"
#   end
end
