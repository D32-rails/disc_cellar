ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def create_dvd
    sign_in(:admin)
    visit dvds_path
    click_on "Add a New DVD"
    fill_in "Title", with: "Divergent"
    fill_in "Genre", with: "Adventure, Sci-Fi, Thriller"
    fill_in "Year", with: 2014
    select('PG-13', from: 'Rated')
    check "Published"
    click_on "Submit request"
    click_on "Sign out"
  end

  def request_dvd
    visit dvds_path
    click_on "Add a New DVD"
    fill_in "Title", with: "Divergent"
    fill_in "Genre", with: "Adventure, Sci-Fi, Thriller"
    fill_in "Year", with: 2014
    select('PG-13', from: 'Rated')
    click_on "Submit request"
  end

  def sign_in(user = :one)
    setup_omniauth(user)
    visit root_path
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]

    click_on("Sign in with Facebook")
  end

  def setup_omniauth(user)
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:facebook,
                             uid: users(user).uid,
                             info: { name: users(user).name },
                             credentials: { token: users(user).oauth_token, expires_at: users(user).oauth_expires_at }
                            )
  end
end
