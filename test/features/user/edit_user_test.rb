require "test_helper"

feature "Edit a User's Profile" do
  scenario "users can view but not edit email address / name" do
    sign_in
    visit edit_user_path(users(:one).id)
    page.must_have_field('Name', disabled: true, with: users(:one).name)
    page.must_have_field('Email', disabled: true, with: users(:one).email)
  end

  scenario "users can edit address" do
    sign_in
    visit edit_user_path(users(:one).id)
    fill_in('Address', with: '111 Eleventh Ave')
    click_on('Submit')
    page.must_have_content('profile has been updated')
  end

  scenario "users cannot edit other user's profiles" do
    # Need to write this when Pundit is installed
  end
end
