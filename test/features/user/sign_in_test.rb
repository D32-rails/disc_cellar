require "test_helper"

feature "Signing in with Facebook" do
  scenario "sign in with Facebook works" do
    sign_in_with_facebook
    page.must_have_content("Signed in as Test User!")
  end
end
