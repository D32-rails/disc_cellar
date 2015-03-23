require "test_helper"

feature "visit a DVD" do
  scenario "test" do
    create_dvd
    visit dvds_path
    click_on "Divergent"
    page.must_have_content "2014"
    page.must_have_content "PG-13"
  end
end
