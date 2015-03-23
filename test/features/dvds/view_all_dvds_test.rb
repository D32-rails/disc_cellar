require "test_helper"

feature "view all dvds" do
  scenario "users can see all dvds" do
    CreateDVD
    visit dvds_path
    page.must_have_content "Divergent"
    page.must_have_content "Viewing all DVDs"
  end
end
