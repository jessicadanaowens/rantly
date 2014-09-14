# require "rails_helper"
#
# feature "User can register" do
#   scenario "successfully" do
#     visit root_url
#
#     click_on "Join"
#     fill_in "Username", :with => "jessica"
#     fill_in "Password", :with => "password"
#     click_on "Register"
#
#     expect(page).to have_content "Thank you for registering"
#   end
#
#   scenario "unsuccessfully" do
#     visit root_url
#
#     click_on "Join"
#     fill_in "Username", :with => ""
#     fill_in "First name", :with => "Jessica"
#     fill_in "Last name", :with => "Owens"
#     fill_in "Bio", :with => "I love to draw!"
#     fill_in "Password", :with => "password"
#     within("#frequency-of-rants-form") do
#       choose "Daily"
#     end
#     click_on "Register"
#
#     expect(page).to have_content "Username can't be blank"
#   end
# end