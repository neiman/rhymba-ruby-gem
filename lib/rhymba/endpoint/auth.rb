module Rhymba
  module Endpoint
    module Auth
      
      PURCHASES_ENDPOINT = "https://purchases.mcnemanager.com/"
      DISPATCH_ENDPOINT  = "https://dispatch.mcnemanager.com/current/"
      
      #
      # This method allows you to exchange a temporary token for access to purchases endpoints
      # 
      #
      # @option options [Object] :method
      #   Required. Name of the API method the hashed access tokens will be used for eventually. i.e. GetStream
      # @option options [Object] :ttl
      #   Required. The TTL (time to live) for the hashed access token that will be generated, in seconds. i.e. 180
      #
      # @see: http://documentation.vlgroup.com/getting-started/authentication
      # Return:
      # access_hint	string	Access hint for your system provided by VL Group.
      # access_req	string	The temporary hashed access request token to be used for authorized requests to the API method it was created for in Step 1.
      # access_token	string	Temporary access token for the specific request you're going to be making. This will differ from your regular system/application Rhymba access token.
      #
      
      def auth_token_purchases(options={})
        throw ArgumentError.new("Required arguments :method") if options[:method].nil?
        throw ArgumentError.new("Required arguments :ttl") if options[:ttl].nil?      
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        self.endpoint = "#{PURCHASES_ENPOINT}"
        post("token.create", options)
      end
      
      #
      # This method allows you to exchange a temporary token for access For stream and download endpoints
      # 
      #
      # @option options [Object] :method
      #   Required. Name of the API method the hashed access tokens will be used for eventually. i.e. GetStream
      # @option options [Object] :ttl
      #   Required. The TTL (time to live) for the hashed access token that will be generated, in seconds. i.e. 180
      # @option options [Object] :type
      #   Required. Sets endpoint for type of token. 
      #   purchases - Purchases
      #   dispatch - Streams and downloads
      #
      # @see: http://documentation.vlgroup.com/getting-started/authentication
      # Return:
      # access_hint	string	Access hint for your system provided by VL Group.
      # access_req	string	The temporary hashed access request token to be used for authorized requests to the API method it was created for in Step 1.
      # access_token	string	Temporary access token for the specific request you're going to be making. This will differ from your regular system/application Rhymba access token.
      #
      
      def auth_token_content(options={})
        throw ArgumentError.new("Required arguments :method") if options[:method].nil?
        throw ArgumentError.new("Required arguments :ttl") if options[:ttl].nil?      
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        self.endpoint = "#{DISPATCH_ENDPOINT}"
        
        post("token.create", options)
      end

    end
  end
end
