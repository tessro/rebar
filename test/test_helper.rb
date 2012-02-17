$:.unshift File.expand_path('../lib', File.dirname(__FILE__))

require 'test/unit'
require 'redis'
require 'rebar'


begin
  require 'ruby-debug'
rescue LoadError
end

class Test::Unit::TestCase
  def connection
    @connection ||= Redis.new(:db => 15).tap do |connection|
                      connection.flushdb
                    end
  end

  def teardown
    connection.flushdb
  end
end
