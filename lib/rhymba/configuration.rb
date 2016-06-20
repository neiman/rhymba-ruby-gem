require 'faraday'
require File.expand_path('../version', __FILE__)

# dont escape request? sure go for it
# module Faraday
#   module NestedParamsEncoder
#     def self.escape(arg)
#       arg
#     end
#   end
#   module FlatParamsEncoder
#     def self.escape(arg)
#       arg
#     end
#   end
# end

module Rhymba
  # Defines constants and methods related to configuration
  module Configuration
    # An array of valid keys in the options hash when configuring a {Rhymba::API}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :access_secret,
      :access_token,
      :token,
      :endpoint,
      :user_agent,
      :proxy,
      :ca_path,
      :ca_file,
      :middlewares,
      :post_header
    ].freeze

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = Faraday.default_adapter

    # By default, don't set an token
    DEFAULT_ACCESS_TOKEN  = nil
    DEFAULT_ACCESS_SECRET = nil
    
    
    # The endpoint that will be used to connect if none is set
    #
    # @note Set for search. others being
    # 
    # search: https://search.mcnemanager.com/current/content.odata/
    # purchases-token: https://purchases.mcnemanager.com/
    # stream-download-token: https://dispatch.mcnemanager.com/current/
    # stream-download: https://dispatch.mcnemanager.com/current/content.odata/
    DEFAULT_ENDPOINT = 'https://search.mcnemanager.com/current/content.odata/'.freeze
  

    # By default, don't use a proxy server
    DEFAULT_PROXY = nil

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "Rhymba Ruby Gem #{Rhymba::VERSION}".freeze

    # Default openssl CA_PATH and CA_FILE path
    DEFAULT_CA_PATH = %x[ openssl version -a | grep OPENSSLDIR | awk '{print $2}'|sed -e 's/\"//g' ]
    DEFAULT_CA_FILE = "#{DEFAULT_CA_PATH}/ca-certificates.crt"

    DEFAULT_MIDDLEWARES = []
    
    # default post headers
    DEFAULT_POST_HEADER = {'Accept' => "application/json; charset=utf-8", 'User-Agent' => "#{DEFAULT_USER_AGENT}"}

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter       = DEFAULT_ADAPTER
      self.access_secret = DEFAULT_ACCESS_SECRET
      self.access_token  = DEFAULT_ACCESS_TOKEN
      self.endpoint      = DEFAULT_ENDPOINT
      self.user_agent    = DEFAULT_USER_AGENT
      self.proxy         = DEFAULT_PROXY
      self.ca_path       = DEFAULT_CA_PATH
      self.ca_file       = DEFAULT_CA_FILE
      self.middlewares   = DEFAULT_MIDDLEWARES
      self.post_header   = DEFAULT_POST_HEADER
    end
  end
end
