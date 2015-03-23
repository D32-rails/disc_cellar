require "test_helper"

class DvdTest < ActiveSupport::TestCase

  def dvd
    @dvd ||= Dvd.new
  end

  def test_valid
    assert dvd.valid?
  end

end
