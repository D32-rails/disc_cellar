require "test_helper"

feature "add a DVD" do
  scenario "a new DVD path exists" do
    visit dvds_path
    click_on "Request a new DVD"
    page.must_have_content "New DVD Request"
  end

  scenario "user can request new DVDs" do
    RequestDVD
    page.must_have_content "Thank you for your request."
  end

  scenario "an admin can approve a new DVD request" do
    CreateDVD
    page.must_have_content "The Princess Bride has been added."
  end
end
