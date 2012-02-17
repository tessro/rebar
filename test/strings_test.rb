require 'test_helper'

class StringsTest < Test::Unit::TestCase
  def test_creates_strings
    Rebar.build(connection) do
      strings(5)
    end

    keys = connection.keys('rebar:string:*')
    assert_equal 5, keys.length, "Created incorrect number of strings"
  end
end
