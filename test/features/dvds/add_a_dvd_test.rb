require "test_helper"

feature "add a DVD" do
  scenario "a new DVD path exists" do
    sign_in_with_facebook
    visit dvds_path
    click_on "Request a new DVD"
    page.must_have_content "Request a new DVD"
  end

  scenario "member can request new DVDs" do
    sign_in_with_facebook
    request_dvd
    page.must_have_content "Thank you for your request."
  end

  scenario "member cannot publish" do
    sign_in_with_facebook
    visit dvds_path
    click_on "Request a new DVD"
    page.wont_have_content "Published"
  end

  scenario "member cannot add new DVDs without admin approval" do
    sign_in_with_facebook
    request_dvd
    visit dvds_path
    page.wont_have_content "Divergent"
  end

  scenario "an admin can approve a new DVD request" do
    sign_in_with_facebook
    request_dvd
    click_on "Sign out"
    sign_in_with_facebook_as_admin
    visit dvds_path
    click_on "Divergent"
    click_on "Edit DVD details"
    check "Published"
    page.wont_have_content "Unpublished"
  end

  scenario "an admin can create and approve a new DVD request" do
    create_dvd
    visit dvds_path
    page.must_have_content "Divergent"
  end
end
