module Rebar
  module DSL
    class Set
      def initialize(connection, key, &block)
        @connection = connection
        @key        = key
        instance_eval(&block) if block_given?
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
