require "test_helper"

feature "Signing in with Facebook" do
  scenario "sign in with Facebook works" do
    sign_in
    page.must_have_content("Signed in as Test One!")
  end
end
