# Rhymba


A Ruby wrapper for the Rhymba API

## Installation

Add this line to your application's Gemfile:

    gem 'rhymba-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rhymba-api

## Documentation

[![Build Status](https://travis-ci.org/vlgroup/rhymba-ruby-gem.svg?branch=master)](https://travis-ci.org/vlgroup/rhymba-ruby-gem)
[![Coverage Status](https://coveralls.io/repos/github/vlgroup/rhymba-ruby-gem/badge.svg?branch=master)](https://coveralls.io/github/vlgroup/rhymba-ruby-gem?branch=master)

See more here: http://documentation.vlgroup.com/

## Usage

```ruby
require "rhymba"

Rhymba.configure do |config|
  config.access_token = "YOUR_ACCESS_TOKEN"
  config.access_secret = "YOUR_SECRET_TOKEN"
end

```

## Examples


## Contributing

1. Fork it ( http://github.com/vlgroup )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
