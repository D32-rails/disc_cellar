require "test_helper"

feature "add a DVD" do
  scenario "a new DVD path exists" do
    visit dvds_path
    click_on "Request a new DVD"
    page.must_have_content "Request a new DVD"
  end

  scenario "member can request new DVDs" do
    request_dvd
    page.must_have_content "Thank you for your request."
  end

  scenario "member cannot publish" do
    visit dvds_path
    click_on "Request a new DVD"
    page.wont_have_content "Published"
  end

  scenario "member cannot add new DVDs without admin approval" do
    request_dvd
    visit dvds_path
    click_on "Divergent"
    page.wont_have_content "Published"
  end

  scenario "an admin can approve a new DVD request" do
    sign_in_with_facebook
    request_dvd
    click_on "Sign out"
    sign_in_with_facebook_as_admin
    visit dvds_path
    click_on "Divergent"
    check "Published"
    page.must_have_content "Divergent has been added."
  end

  scenario "an admin can create and approve a new DVD request" do
    create_dvd
    page.must_have_content "Divergent has been added."
  end
end
