require "test_helper"

feature "delete a DVD" do
  scenario "admin users can delete a DVD from the global collection" do
    CreateDVD
    click_on "Divergent"
    click_on "Delete movie"
    page.must_have_content "The movie has been deleted."
    page.wont_have_content "Divergent"
  end
end
