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

## Usage

```ruby
require "rhymba"

Rhymba.configure do |config|
  config.token = "YOUR_TOKEN"
end

Rhymba.auth_test
```

## Examples


## Contributing

1. Fork it ( http://github.com/vlgroup )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
