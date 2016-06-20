
module Rhymba
  module Endpoint
    module Stream
      
      STREAM_ENDPOINT = "https://dispatch.mcnemanager.com/current/content.odata/"
      #
      # This method gets a stream url, all options are required
      #
      # Method: GetStream - used in auth token
      #
      # @option options [Object] :access_hint
      #   Required. The access_hint value returned from the creation of the request token.	
      # @option options [Object] :access_req
      #   Required. The access_req value returned from the creation of the request token.	
      # @option options [Object] :access_token
      #   Required. The access_token value returned from the creation of the request token, not your regular access token.
      # @option options [Object] :mediaId
      #   Required. The media ID for which you're getting a stream.	123456
      # @option options [Object] $format
      #   Required. Specify the format to return the data in. If this is missing or blank, 'atom' will be used.	json
      # @option options [Object] :bitrate
      #   Required. Specifies the kilobits per second for the returned content stream to be encoded in.	64, 128, 192, or 256
      # @option options [Object] :encoding
      #   Required. NOTE: Single quotes in value! Name of the codec to use for the returned stream.	'mp3', 'flac', 'heaac' or 'aac'
      # @option options [Object] :fadeEnd
      #   Required. Specifies the number of seconds for the track to fade out. This is from the end of the track after it has been trimmed by trimEnd.	0 for full length play. Only custom programs use other values.
      # @option options [Object] :fadeStart
      #   Required. Specifies the number of seconds for the track to fade in. This is from the beginning of the track after it has been trimmed by trimStart.	Typically 0
      # @option options [Object] :https
      #   Required. Specifies if the content should use secure URLs. This is only valid when protocol is set to 'http'.	true or false
      # @option options [Object] :luid
      #   Required. Specifies the unique user id of the person that is listening to this stream. This value can be the same as suid if the same person generated and is listening to the stream. If a luid does not exist, pass in 'NA'.	'user123'
      # @option options [Object] :mono
      #   Required. Specifies if the audio should be encoded in monophonic format.	true or false
      # @option options [Object] :protocol
      #   Required. NOTE: Single quotes in value! Specifies the streaming protocol to return the content in.	'http', 'rtmp' or 'hls'
      # @option options [Object] :suid
      #   Required. Specifies the unique user id of the person that generated this stream request. This value can be the same as luid if the same person generated and is listening to the stream. If a suid does not exist, pass in 'NA'.	'user123'
      # @option options [Object] :trimEnd
      #   Required. Specifies the number of seconds to remove from the end of the track. This is useful for creating preview clips of a track. If this number is 0, it will not remove any content from the end of the track.	Typically 0
      # @option options [Object] :trimStart
      #   Required. Specifies the number of seconds to remove from the beginning of the track. This is useful for creating preview clips of a track. If this number is 0, it will not remove any content from the beginning of the track.
      #
      # @see http://documentation.vlgroup.com/streaming/introduction
      #
      # Return
      # :id	[integer]	The unique id for media in the stream.	12345
      # :url_segment_one	[string]	If the protocol requested was 'http' this will be the URL for the content stream. If 'rtmp' was requested, it will be the application. If 'hls' was requested, it will be the URL for the index file.	"https://my.server.com/subdir/track1.mp3", "rtmp://server.com/application/", or "https://hls.server.com/subdir/track1.m3u8"
      # :url_segment_two	[string]	If the protocol requested was http this will be blank. If rtmp was requested, it will be the stream name prefixed by the file format.	"mp3:subdir/track1"

      def stream_get(options={})
        throw ArgumentError.new("Required arguments :access_hint missing") if options[:access_hint].nil?
        throw ArgumentError.new("Required arguments :access_req missing") if options[:access_req].nil?
        throw ArgumentError.new("Required arguments :access_token missing") if options[:access_token].nil?
        throw ArgumentError.new("Required arguments :mediaId missing") if options[:mediaId].nil?
        throw ArgumentError.new("Required arguments $format missing") if options["$format"].nil?
        throw ArgumentError.new("Required arguments :bitrate missing") if options[:bitrate].nil?
        throw ArgumentError.new("Required arguments :encoding missing") if options[:encoding].nil?
        throw ArgumentError.new("Required arguments :fadeEnd missing") if options[:fadeEnd].nil?
        throw ArgumentError.new("Required arguments :fadeStart missing") if options[:fadeStart].nil?
        throw ArgumentError.new("Required arguments :https missing") if options[:https].nil?
        #throw ArgumentError.new("Required arguments :luid missing") if options[:luid].nil?
        throw ArgumentError.new("Required arguments :mono missing") if options[:mono].nil?
        throw ArgumentError.new("Required arguments :protocol missing") if options[:protocol].nil?
        #throw ArgumentError.new("Required arguments :suid missing") if options[:suid].nil?
        throw ArgumentError.new("Required arguments :trimEnd missing") if options[:trimEnd].nil?
        throw ArgumentError.new("Required arguments :trimStart missing") if options[:trimStart].nil?
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        options = options.merge(access_token: options[:access_token]) 
        self.endpoint = "#{STREAM_ENDPOINT}"
        get("GetStream", options)
      end

    end
  end
end
