require "test_helper"

feature "edit a DVD" do
  scenario "members cannot hack the edit DVD details" do
    create_dvd
    sign_in
    visit dvds_path
    click_on "Divergent"
    page.wont_have_content "Edit"
    visit edit_dvd_path(dvds(:grownups).id)
    page.must_have_content "not authorized"
  end

  scenario "unauthenticated users cannot hack the edit DVD details" do
    visit edit_dvd_path(dvds(:grownups).id)
    page.must_have_content "not authorized"
  end

  scenario "admin user can edit DVD details from the global collection" do
    create_dvd
    sign_in(:admin)
    visit dvds_path
    click_on "Divergent"
    click_on "Edit DVD details"
    fill_in "Genre", with: "Adventure, Sci-Fi"
    check "Published"
    click_on "Submit request"
    page.must_have_content "Divergent has been added to your collection."
  end
end
