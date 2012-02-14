require "rebar/version"
require "rebar/builder"
require "rebar/random"
require "rebar/dsl"

module Rebar
  def self.build(connection, options = {}, &block)
    builder = Rebar::Builder.new(connection)
    builder.clean! unless options[:clean] == false
    builder.build(&block)
  end
end
