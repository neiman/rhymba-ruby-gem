require "rhymba"
require "yaml"


access_token = ENV["ACCESS_TOKEN"] || (print "Access_Token: "; gets.strip)
access_secret = ENV["ACCESS_SECRET"] || (print "ACCESS_SECRET: "; gets.strip)
client = Rhymba::Client.new access_token: access_token, access_secret: access_secret

puts "Search"
puts
puts    
@media = client.search_media("$format" => "json","$top" => "4","keyword" => "rick springfield","$select" => "id,title,artist_name,bitrate")
puts "Get Stream Token"
puts
puts   
@auth = client.auth_token_content(:method => "GetStream", :ttl => 180, :mediaId => "#{@media["value"][0]["id"]}".to_i, :use_limit => 100, :bitrate => 128, :encoding => "'mp3'", :fadeEnd => 0, :fadeStart => 0, :https => "true",:mono => "false", :protocol => "'http'", :trimEnd => 0, :trimStart => 0)
puts "Get Stream url"
puts
puts
@stream = client.stream_get(:access_hint => "#{@auth["access_hint"]}", :access_req => "#{@auth["access_req"]}", :access_token => "#{@auth["access_token"]}", :mediaId => "#{@media["value"][0]["id"]}".to_i, "$format" => "json", :bitrate => 128, :encoding => "'mp3'", :fadeEnd => 0, :fadeStart => 0, :https => "true", :mono => "false", :protocol => "'http'", :trimEnd => 0, :trimStart => 0)

sleep 1
