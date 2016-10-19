<p align="center">
  <a href="http://vlgroup.com/">
    <img alt="VLGroup" src="http://cuspmagazine.com/wp-content/uploads/2016/03/Header-VL-group.jpg" width="546">
  </a>
</p>
<p align="center">
[![Gem Version](https://badge.fury.io/rb/rhymba-api.svg)](https://badge.fury.io/rb/rhymba-api)
[![Build Status](https://travis-ci.org/vlgroup/Rhymba-music-api-ruby-gem.svg?branch=master)](https://travis-ci.org/vlgroup/rhymba-ruby-gem)

# VL Group
At VL Group, we specialize in creating unique, integrated digital experiences through the combined powers of music + technology.

# Rhymba API
VL Group's Rhymba platform is a series of REST-like APIs and endpoints designed to make integrating music downloads, streaming, previews, and artwork into your site or service as easy and efficient as possible. Using OData-based URL structures and returning JSON or XML, Rhymba allows you to search for content, request specific content, deliver it in a variety of ways, and more, in a scalable and lightning-fast manner, regardless of your server-side programming language. You can also query Rhymba using client-side Javascript, from within Flash-based applications, or within mobile applications for usage across a variety of non-traditional applications. Sign up for access [here](http://rhymbamanager.vervelife.com/apisignup).

A Ruby wrapper for the Rhymba API

## Installation

Add this line to your application's Gemfile:

    gem 'rhymba-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rhymba-api

## Documentation




See more here: http://documentation.vlgroup.com/

## Usage

```ruby
require "rhymba"

access_token = ENV["ACCESS_TOKEN"] || (print "ACCESS_TOKEN: "; gets.strip)
access_secret = ENV["ACCESS_SECRET"] || (print "ACCESS_SECRET: "; gets.strip)
client = Rhymba::Client.new access_token: access_token, access_secret: access_secret

puts "Search Media"
@media = client.search_media("$format" => "json","$top" => "4","keyword" => "rick springfield","$select" => "id,title,artist_name,bitrate")

puts "Get Stream Auth Token"
@auth = client.auth_token_content(:method => "GetStream", :ttl => 180, :mediaId => "#{@media["value"][0]["id"]}".to_i, :use_limit => 100, :bitrate => 128, :encoding => "'mp3'", :fadeEnd => 0, :fadeStart => 0, :https => "true",:mono => "false", :protocol => "'http'", :trimEnd => 0, :trimStart => 0)

```

## Contributing

1. Fork it ( http://github.com/vlgroup )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
