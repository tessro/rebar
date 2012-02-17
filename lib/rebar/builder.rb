module Rebar
  class Builder
    def initialize(connection)
      @connection = connection
    end

    attr_reader :connection
    attr_reader :system_cpu_time
    attr_reader :user_cpu_time
    attr_reader :memory_delta

    def build(&block)
      initial_cpu_sys  = connection.info['used_cpu_sys'].to_i
      initial_cpu_user = connection.info['used_cpu_user'].to_i
      initial_memory   = connection.info['used_memory'].to_i

      Rebar::DSL::Database.new(connection).instance_eval(&block)

      @system_cpu_time = connection.info['used_cpu_sys'].to_i  - initial_cpu_sys
      @user_cpu_time   = connection.info['used_cpu_user'].to_i - initial_cpu_user
      @memory_delta    = connection.info['used_memory'].to_i   - initial_memory
    end

    def clean!
      connection.keys('rebar:*').each do |key|
        connection.del(key)
      end
    end
  end
end
