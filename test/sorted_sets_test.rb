require 'test_helper'

class SortedSetsTest < Test::Unit::TestCase
  def test_creates_sorted_sets
    Rebar.build(connection) do
      sorted_sets(5) do
        members(10)
      end
    end

    keys = connection.keys('rebar:sorted_set:*')
    assert_equal 5, keys.length, "Created incorrect number of sorted sets"

    keys.each do |key|
      assert_equal 10, connection.zrange(key, 0, -1).length, "Created incorrect number of members in sorted set #{key}"
    end
  end
end
