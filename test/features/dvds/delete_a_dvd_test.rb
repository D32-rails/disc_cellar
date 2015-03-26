require "test_helper"

feature "delete a DVD" do
  scenario "admin users can delete a DVD from the global collection" do
    create_dvd
    sign_in(:admin)
    visit dvds_path
    click_on "Divergent"
    click_on "Delete DVD"
    page.must_have_content "This DVD has been deleted."
    page.wont_have_content "Divergent"
  end

  scenario "member cannot hack to delete a DVD from the global collection" do
    page.driver.submit :delete, dvd_path(dvds(:grownups).id), {}
    page.must_have_content "not authorized"
  end

  scenario "unauthenticated user cannot delete a DVD from the global collection" do
    page.driver.submit :delete, dvd_path(dvds(:grownups).id), {}
    page.must_have_content "not authorized"
  end
end
