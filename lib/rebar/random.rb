require 'digest'

module Rebar
  module Random
    def self.score
      rand * 1_000_000_000
    end

    def self.string
      Digest::SHA256.hexdigest(Time.now.to_s + rand.to_s)
    end
  end
end
