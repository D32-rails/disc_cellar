require "test_helper"

feature "Borrowing - asking" do
  scenario "can ask to borrow another user's DVD" do
    sign_in
    visit user_path(users(:two).id)
    click_on("Ask to Borrow")
    page.text.must_include("Request sent to lender!")
  end
end
