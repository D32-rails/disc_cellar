require "test_helper"

feature "delete a DVD" do
  scenario "admin users can delete a DVD from the global collection" do
    create_dvd
    visit dvds_path
    click_on "Divergent"
    click_on "Delete DVD"
    page.must_have_content "This DVD has been deleted."
    page.wont_have_content "Divergent"
  end
end