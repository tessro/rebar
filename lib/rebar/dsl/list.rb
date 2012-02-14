module Rebar
  module DSL
    class List
      def initialize(connection, key)
        @connection = connection
        @key        = key
      end

      attr_reader :connection
      attr_reader :key

      def elements(count)
        count.times do
          connection.rpush(key, Rebar::Random.string)
        end
      end
    end
  end
end
