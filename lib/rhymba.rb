require_relative "rhymba/error"
require_relative "rhymba/configuration"
require_relative "rhymba/api"
require_relative "rhymba/client"
require_relative "rhymba/version"

module Rhymba
  extend Configuration

  # Alias for Rhymba::Client.new
  #
  # @return [Rhymba::Client]
  def self.client(options={})
    Rhymba::Client.new(options)
  end

  # Delegate to Rhymba::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Rhymba::Client
  def self.respond_to?(method, include_all=false)
    return client.respond_to?(method, include_all) || super
  end
end
