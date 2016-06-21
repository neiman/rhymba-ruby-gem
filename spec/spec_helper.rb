require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter

SimpleCov.start do
  add_filter '.bundle/'
end

require 'rhymba'
require 'webmock/rspec'
require 'vcr'
WebMock.disable_net_connect!(allow_localhost: true)

module Helpers
  def valid_access_token
    $stderr.puts "Please set valid_token to ENV['ACCESS_TOKEN']" if ENV['ACCESS_TOKEN'].nil?
    @access_token ||= ENV['ACCESS_TOKEN'] || (print "ACCESS_TOKEN: "; gets.strip)
  end
  
  def valid_access_secret
    $stderr.puts "Please set valid_token to ENV['ACCESS_SECRET']" if ENV['ACCESS_SECRET'].nil?
    @access_secret ||= ENV['ACCESS_SECRET'] || (print "ACCESS_SECRET: "; gets.strip)
  end

  def valid_client
    @valid_client ||= Rhymba::Client.new(access_token: valid_access_token, access_secret: valid_access_secret)
  end
  
  def test_media_id
    @test_media_id ||= "17004125"
  end
  

end

include Helpers
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.order = 'random'
  config.include Helpers
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.default_cassette_options = { :record => :new_episodes }
  c.configure_rspec_metadata!
  c.filter_sensitive_data("<ACCESS_TOKEN>") { valid_access_token }
  c.filter_sensitive_data("<ACCESS_SECRET>") { valid_access_secret }
end
