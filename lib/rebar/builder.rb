module Rebar
  class Builder
    def initialize(connection)
      @connection = connection
    end

    attr_reader :connection

    def build(&block)
      Rebar::DSL::Database.new(connection).instance_eval(&block)
    end

    def clean!
      connection.keys('rebar:*').each do |key|
        connection.del(key)
      end
    end
  end
end
