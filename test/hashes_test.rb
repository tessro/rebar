require 'test_helper'

class HashesTest < Test::Unit::TestCase
  def test_creates_hashes
    Rebar.build(connection) do
      hashes(5) do
        keys(10)
      end
    end

    keys = connection.keys('rebar:hash:*')
    assert_equal 5, keys.length, "Created incorrect number of hashes"

    keys.each do |key|
      assert_equal 10, connection.hkeys(key).length, "Created incorrect number of keys in hash #{key}"
    end
  end
end
