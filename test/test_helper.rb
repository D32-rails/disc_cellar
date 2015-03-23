ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def create_dvd
    visit dvds_path
    click_on "Request a new DVD"
    fill_in "Title", with: "Divergent"
    fill_in "Genre", with: "Adventure, Sci-Fi, Thriller"
    fill_in "Year", with: 2014
    select('PG-13', from: 'Rating')
    click_on "Approved"
  end

  def request_dvd
    visit dvds_path
    click_on "Request a new DVD"
    fill_in "Title", with: "Divergent"
    fill_in "Genre", with: "Adventure, Sci-Fi, Thriller"
    fill_in "Year", with: 2014
    select('PG-13', from: 'Rating')
    click_on "Submit request"
  end
end
