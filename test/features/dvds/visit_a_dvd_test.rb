require "test_helper"

feature "visit a DVD" do
  scenario "Admin can view a DVD" do
    create_dvd
    sign_in_with_facebook_as_admin
    visit dvds_path
    click_on "Divergent"
    page.must_have_content "2014"
    page.must_have_content "PG-13"
  end

  scenario "Member can view a DVD" do
    create_dvd
    sign_in_with_facebook
    visit dvds_path
    click_on "Divergent"
    page.must_have_content "2014"
    page.must_have_content "PG-13"
    page.wont_have_content "Delete DVD"
  end

  scenario "NullUser can view a DVD" do
    create_dvd
    visit dvds_path
    click_on "Divergent"
    page.must_have_content "2014"
    page.must_have_content "PG-13"
    page.wont_have_content "Delete DVD"
    page.wont_have_content "Edit DVD"
  end
end
