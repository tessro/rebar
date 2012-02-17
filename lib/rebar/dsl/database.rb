module Rebar
  module DSL
    class Database
      def initialize(connection)
        @connection = connection
        @max_ids = ::Hash.new(0)
      end

      attr_reader :connection

      def strings(count)
        count.times do
          connection.set("rebar:string:#{next_id(:string)}", Rebar::Random.string)
        end
      end

      def hashes(count, &block)
        count.times do
          Rebar::DSL::Hash.new(connection, "rebar:hash:#{next_id(:hash)}", &block)
        end
      end

      def lists(count, &block)
        count.times do
          Rebar::DSL::List.new(connection, "rebar:list:#{next_id(:list)}", &block)
        end
      end

      def sets(count, &block)
        count.times do
          Rebar::DSL::Set.new(connection, "rebar:set:#{next_id(:set)}", &block)
        end
      end

      def sorted_sets(count, &block)
        count.times do
          Rebar::DSL::SortedSet.new(connection, "rebar:sorted_set:#{next_id(:sorted_set)}", &block)
        end
      end

      private

      def next_id(type)
        @max_ids[type] += 1
      end
    end
  end
end
