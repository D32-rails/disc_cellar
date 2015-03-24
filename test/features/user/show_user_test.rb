require "test_helper"

feature "Show a user" do
  scenario "can see an individual user profile" do
    visit users_path
    page.must_have_content("Members")
  end
end
