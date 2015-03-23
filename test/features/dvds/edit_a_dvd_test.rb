require "test_helper"

feature "edit a DVD" do
  scenario "users can edit DVD details from the global collection" do
    request_dvd
    visit dvds_path
    click_on "Divergent"
    click_on "Edit DVD details"
    fill_in "Genre", with: "Adventure, Sci-Fi"
    click_on "Submit request"
    page.must_have_content "Thank you for your request."
  end

  scenario "admin user can edit DVD details from the global collection" do
    create_dvd
    visit dvds_path
    click_on "Divergent"
    click_on "Edit DVD details"
    fill_in "Genre", with: "Adventure, Sci-Fi"
    check "Published"
    click_on "Submit request"
    page.must_have_content "Divergent has been updated."
  end
end
