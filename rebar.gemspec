# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rebar/version', __FILE__)

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'rebar'
  s.version     = Rebar::VERSION
  s.summary     = 'A simple stress testing tool for Redis'
  s.description = ''
  s.license     = 'MIT'

  s.required_ruby_version = '>= 1.9.2'

  s.author        = 'Paul Rosania'
  s.email         = 'paul.rosania@gmail.com'
  s.homepage      = "https://github.com/paulrosania/rebar"

  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path  = 'lib'

  s.add_runtime_dependency('redis', '>= 2.2')
end
