require 'test_helper'

class ListsTest < Test::Unit::TestCase
  def test_creates_lists
    Rebar.build(connection) do
      lists(5) do
        elements(10)
      end
    end

    keys = connection.keys('rebar:list:*')
    assert_equal 5, keys.length, "Created incorrect number of lists"

    keys.each do |key|
      assert_equal 10, connection.llen(key), "Created incorrect number of elements in set #{key}"
    end
  end
end
