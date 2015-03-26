require "test_helper"

feature "edit a DVD" do
  # scenario "members cannot publish edited DVD details from the global collection" do
  #   create_dvd
  #   sign_in_with_facebook
  #   visit dvds_path
  #   click_on "Divergent"
  #   page.wont_have_content "Edit"
  # end

  scenario "admin user can edit DVD details from the global collection" do
    create_dvd
    sign_in_with_facebook_as_admin
    visit dvds_path
    click_on "Divergent"
    click_on "Edit DVD details"
    fill_in "Genre", with: "Adventure, Sci-Fi"
    check "Published"
    click_on "Submit request"
    page.must_have_content "Divergent has been added to your collection."
  end
end
