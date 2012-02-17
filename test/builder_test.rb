require 'test_helper'

class BuilderTest < Test::Unit::TestCase
  def test_clean_should_remove_all_keys
    connection.set('rebar:foo', 'bar')
    Rebar::Builder.new(connection).clean!
    assert_equal 0, connection.keys('rebar:*').length
  end
end
