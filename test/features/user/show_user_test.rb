require "test_helper"

feature "Show a user" do
  scenario "can see user index" do
    visit users_path
    page.must_have_content("Members")
  end

  scenario "can see a user profile" do
    sign_in
    visit user_path(users(:one).id)
    page.must_have_content(users(:one).name)
  end

  scenario "can see a user's address on the profile" do
    sign_in
    visit user_path(users(:one).id)
    page.must_have_content("Address")
    page.must_have_content("111 First Street")
  end

  scenario "user can see their own DVD collection on the profile" do
    create_dvd
    sign_in
    visit user_path(users(:one).id)
    page.must_have_content "Test One"
    page.must_have_content "Address:"
  end

  scenario "user can see their borrowings on their profile" do
    sign_in
    visit user_path(users(:one).id)
    page.text.must_include "Borrowing"
  end

  scenario "user can see their lendings on their profile" do
    sign_in
    visit user_path(users(:one).id)
    page.text.must_include "Lending"
  end

  scenario "user cannot see borrowings or lendings on other profiles" do
    sign_in
    visit user_path(users(:two).id)
    page.text.wont_include "Borrowing"
    page.text.wont_include "Lending"
  end
end
