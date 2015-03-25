require "test_helper"

feature "Show a user" do
  scenario "can see user index" do
    visit users_path
    page.must_have_content("Members")
  end

  scenario "can see a user profile" do
    visit user_path(users(:one).id)
    page.must_have_content(users(:one).name)
  end

  scenario "can see a user's address on the profile" do
    visit user_path(users(:one).id)
    page.must_have_content("Address")
    page.must_have_content("111 First Street")
  end

  scenario "user can see their own DVD collection on the profile" do
    create_dvd
    sign_in
    visit dvds_path
    click_on "Signed in as Test One!"
    page.must_have_content "Test One"
    page.must_have_content "Address:"
  end
end
