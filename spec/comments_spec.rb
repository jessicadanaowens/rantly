require "rails_helper"

feature "User can comment on a rant", :js=>true do
  scenario "when user visits rants page" do
    user = create_user
    create_another_rant(user)

    register
    login
    expect(page).to have_content("another rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rantanother rant")

    click_on "another"
    fill_in "comment_text", :with => "yo"
    click_on "RANT BACK"
    expect(page).to have_content "yo"
  end
end