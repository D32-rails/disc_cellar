require "test_helper"

feature "edit a DVD" do
  scenario "users can edit movie details from the global collection" do
    CreateDVD
    click_on "Divergent"
    click_on "Edit movie details"
    fill_in "Genre", with: "Adventure, Sci-Fi"
    click_on "Submit request for changes"
    page.must_have_content "Thank you for your request."
  end

  scenario "admin user can edit movie details from the global collection" do
    CreateDVD
    click_on "Divergent"
    click_on "Edit movie details"
    fill_in "Genre", with: "Adventure, Sci-Fi"
    click_on "Approved"
    page.must_have_content "Divergent has been updated."
  end
end
