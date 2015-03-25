ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def create_dvd
    sign_in_with_facebook_as_admin
    visit dvds_path
    click_on "Request a new DVD"
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
    click_on "Request a new DVD"
    fill_in "Title", with: "Divergent"
    fill_in "Genre", with: "Adventure, Sci-Fi, Thriller"
    fill_in "Year", with: 2014
    select('PG-13', from: 'Rated')
    click_on "Submit request"
  end

  def sign_in_with_facebook
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:facebook,
                            {
                              uid: '12345',
                              info: { name: 'Test User' },
                              credentials: { token: 'ABCDEF', expires_at: 3.hours.from_now }
                              })
    visit root_path
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]

    click_on("Sign in with Facebook")
  end

  def sign_in_with_facebook_as_admin
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:facebook,
                            {
                              uid: '12345',
                              info: { name: 'Test User' },
                              credentials: { token: 'ABCDEF', expires_at: 3.hours.from_now }
                              })
    visit root_path
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]

    click_on("Sign in with Facebook")
    u = User.last
    u.role = 2
    u.save!
  end
end
