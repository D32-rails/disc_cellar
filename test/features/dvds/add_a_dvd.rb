require "test_helper"

feature "add a DVD" do
  scenario "a new DVD path exists" do
    visit dvds_path
    click_on "Request a new DVD"
    page.must_have_content "New DVD Request"
  end

  scenario "user can request new DVDs" do
    visit dvds_path
    click_on "Request a new DVD"
    fill_in "Title", with: "Divergent"
    fill_in "Genre", with: "Adventure, Sci-Fi, Thriller"
    fill_in "Year", with: 2014
    select('PG-13', from: 'Rating')
    click_on "Submit request"
    page.must_have_content "Thank you for your request."
  end

  scenario "an admin can approve a new DVD request" do
    visit dvds_path
    click_on "Request a new DVD"
    fill_in "Title", with: "The Princess Bride"
    fill_in "Genre", with: "Adventure, Comedy, Family"
    fill_in "Year", with: 1987
    select('PG', from: 'Rating')
    click_on "Approved"
    page.must_have_content "The Princess Bride has been added."
  end
end
