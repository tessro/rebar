require 'test_helper'

class SetsTest < Test::Unit::TestCase
  def test_creates_sets
    Rebar.build(connection) do
      sets(5) do
        members(10)
      end
    end

    keys = connection.keys('rebar:set:*')
    assert_equal 5, keys.length, "Created incorrect number of sets"

    keys.each do |key|
      assert_equal 10, connection.smembers(key).length, "Created incorrect number of members in set #{key}"
    end
  end
end
