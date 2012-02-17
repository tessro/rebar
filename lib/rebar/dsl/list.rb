module Rebar
  module DSL
    class List
      def initialize(connection, key, &block)
        @connection = connection
        @key        = key
        instance_eval(&block) if block_given?
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
