# require "rails_helper"
#
# feature "search field" do
#   scenario "user can search by last name" do
#     login
#     create_rant
#
#     click_on "LOGOUT"
#
#     visit homepage_path
#
#     click_on "Join"
#     fill_in "Username", :with => "Blake"
#     fill_in "First name", :with => "Blake"
#     fill_in "Last name", :with => "Calderwood"
#     fill_in "Bio", :with => "yo!"
#     fill_in "Password", :with => "password"
#     within("#frequency-of-rants-form") do
#       choose "user_frequency_daily"
#     end
#     click_on "Register"
#
#     within('#navbar-links') do
#       click_on "Login"
#     end
#
#     fill_in "Username", :with => "Blake"
#     fill_in "Password", :with => "password"
#
#     within('#login-button') do
#       click_on "Login"
#     end
#
#     click_on "Search"
#
#     expect(page).to have_content "Blake Calderwood"
#
#     fill_in
#   end
# end