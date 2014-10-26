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
    expect(page).to have_content "can't be blank"
    expect(page).to have_content "can't be blank"
  end

  scenario "User can delete a rant that they've created", :js=>true do
    register
    login
    create_rant
    page.find(".button").click
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
end
