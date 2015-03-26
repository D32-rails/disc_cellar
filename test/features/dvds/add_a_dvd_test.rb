require "test_helper"

feature "add a DVD" do
  scenario "a new DVD path exists" do
    sign_in(:admin)
    visit dvds_path
    click_on "Request a new DVD"
    page.must_have_content "Request a new DVD"
  end

  scenario "member cannot request new DVDs" do
    sign_in
    visit dvds_path
    page.wont_have_content "Request a new DVD"
  end

  scenario "member cannot hack the new DVDs path" do
    sign_in
    visit new_dvd_path
    page.must_have_content "not authorized"
  end

  scenario "unauthenticated user cannot hack the new DVDs path" do
    visit new_dvd_path
    page.must_have_content "not authorized"
  end

  scenario "an admin can create and approve a new DVD request" do
    create_dvd
    visit dvds_path
    page.must_have_content "Divergent"
  end
end
