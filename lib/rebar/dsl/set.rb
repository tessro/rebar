module Rebar
  module DSL
    class Set
      def initialize(connection, key)
        @connection = connection
        @key        = key
      end

      attr_reader :connection
      attr_reader :key

      def members(count)
        count.times do
          connection.sadd(key, Rebar::Random.string)
        end
      end
    end
  end
end
