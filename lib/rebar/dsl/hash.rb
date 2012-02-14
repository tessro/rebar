module Rebar
  module DSL
    class Hash
      def initialize(connection, key)
        @connection = connection
        @key        = key
      end

      attr_reader :connection
      attr_reader :key

      def keys(count)
        count.times do
          connection.hset(key, Rebar::Random.string, Rebar::Random.string)
        end
      end
    end
  end
end
