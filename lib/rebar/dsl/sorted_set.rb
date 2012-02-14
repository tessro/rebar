module Rebar
  module DSL
    class SortedSet
      def initialize(connection, key)
        @connection = connection
        @key        = key
      end

      attr_reader :connection
      attr_reader :key

      def members(count)
        count.times do
          connection.zadd(key, Rebar::Random.score, Rebar::Random.string)
        end
      end
    end
  end
end
