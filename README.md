# Rebar

![Rebar](http://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Trebar.jpg/220px-Trebar.jpg)

A simple stress testing tool for Redis.

* Are sorted sets fast enough with 1,000,000 items?
* How big a dataset will fit in a 512 MB Redis instance?
* Should I use a thousand hashes with a thousand keys, or a million strings?

Rebar makes it easy to fill a Redis instance with sample data, so you can test
performance under different database designs. Check memory usage and database
creation time, or prepare a test dataset for a benchmarking exercise.

## Installation

Add this line to your application's Gemfile:

    gem 'rebar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rebar

## Usage

More documentation to follow. For now, here's some sample code.

    require 'rubygems'
    require 'rebar'
    require 'redis'

    Rebar.build(Redis.new) do
      # Build 10 sets with 100 members each
      sets(10) do
        members 100
      end

      # Build 10 sorted sets with 100 members each
      sorted_sets(10) do
        members 100
      end

      # Build 10 hashes with 100 keys each
      hashes(10) do
        keys 100
      end

      # Build 10 lists with 100 elements each
      lists(10) do
        elements 100
      end

      # Build 10 random key-value pairs
      strings(10)
    end

By default, Rebar cleans the `rebar` namespace before it builds a dataset. To
disable this behavior, pass `:clean => false` when you call `Rebar.build`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
