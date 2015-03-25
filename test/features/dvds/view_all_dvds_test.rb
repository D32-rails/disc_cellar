require "test_helper"

feature "view all DVDs" do
  scenario "members can see all DVDs" do
    create_dvd
    sign_in
    visit dvds_path
    page.must_have_content "Divergent"
    page.must_have_content "Viewing all DVDs"
  end

  scenario "NullUser can see all DVDs" do
    create_dvd
    visit dvds_path
    page.must_have_content "Divergent"
    page.must_have_content "Viewing all DVDs"
    page.wont_have_content "Request a new DVD"
  end
end
