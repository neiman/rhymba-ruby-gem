module Rhymba
  module Endpoint
    module Download
      
      DOWNLOAD_CREATE_ENDPOINT = "https://dispatch.mcnemanager.com/current/content.odata/"
      DOWNLOAD_UPDATE_ENDPOINT = "https://dispatch.mcnemanager.com/current/content.odata/"
      DOWNLOAD_GET_SESSION_INFO_ENDPOINT = "https://dispatch.mcnemanager.com/current/content.odata/"
      
      #
      # This method gets a download session
      #
      # Method: CreateDownloadSession - used in auth token    
      #  
      # @option options [Object] :access_hint
      #   Required. The access_hint value returned from the creation of the request token.	
      # @option options [Object] :access_req
      #   Required. The access_req value returned from the creation of the request token.	
      # @option options [Object] :access_token
      #   Required. The access_token value returned from the creation of the request token, not your regular access token.
      # @option options [Object] $format
      #   Required. Specify the format to return the data in. If this is missing or blank, 'atom' will be used.	json
      # @option options [Object] :albids
      #   Comma-delimited array of VL Groupalbum ids to be downloaded*	45346,34234,23145
      # @option options [string] :codeid
      #   Promotional code associated with this download, if any	FreeTrackDownload1232
      # @option options [string] :countryCode
      #   2-letter country where the download will take place	US
      # @option options [integer] :ttlSeconds
      #   How long, in seconds, this download session should be available. Default is 24 hours (86,400 seconds).	86400
      # @option options [integer] :downloadLimit
      #   Number of download attempts allowed before this request becomes invalidated	3
      # @option options [Object] :mids
      #   Comma-delimited array of VL Groupmedia ids to be downloaded*	12133,44345
      # @option options [string] :other
      #   Other information tied to this download request that you want to protect against request tampering. See the note below about "locked parameters" for more details. This is also important if you plan on using our Download Manager Application and you want to use custom campaign banners. See our Rhymba Manager documentation here for more information about our Download Manager Application.	cust_IP: 192.1.1.3, campaignId: 129Required. The access_token value returned from the creation of the request token, not your regular access token.
      # @option options [int] :playlistId
      #   Playlist ID from our Playlist API associated with this download, if any*	my_songs
      # @option options [String] :purchaseid
      #   Purchase id associated with this download	14534632
      # @option options [String] :test
      #   boolean	Whether this download should be marked as a test in our system	true or false
      # @option options [String] :trackingid
      #   Other tracking id for this download, if any	unit_tests_Mar_3_2013_3
      # @option options [String] :userid
      #   Your identifier for the user receiving the download	cust_name@gmail.com,cust2323
      # @option options [String] :zip
      #   ZIP code of customer receiving the download	11211
      # @option options [String] :dirName
      #   If using our lightweight Download Manager, the subdirectory that will be created in the OS default music folder when the user downloads.	VendorName
      # @option options [String] :plName
      #   If using our lightweight Download Manager, the playlist name that will appear if users choose to import downloaded media into iTunes or Windows Media Player.	My Awesome Playlist
      # @option options [String] :expires
      #   he fixed date of when the download session token expires.	
      # @option options [Int] :maxUses
      #   The maximum amount of times this download session token is able to be used in an attempted download.
      #
      # @see http://documentation.vlgroup.com/downloads/introduction
      # return:
      # :token [string]	The download session token you should use in fulfilmment requests.	
      # :url		[String]	Base url where the customer’s download request should be directed.	
      # 
      
      def download_create_session(options={})
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        options = options.merge(access_token: options[:access_token]) 
        self.endpoint = "#{DOWNLOAD_CREATE_ENDPOINT}"
        get("CreateDownloadSession", options)
      end
      
      #
      # This method to update a download session
      #
      # Method: UpdateDownloadSession - used in auth token      
      #
      # @option options [String] :token
      #   The token for the download session you wish to update.
      # @option options [Integer] :ttlSeconds
      #   Update the TTL (time to live) for this download session token.
      # @option options [Integer] :downloadLimit
      #   The maximum amount of times this download session can be downloaded by the user.
      # @option options [String] :dirName
      #   If using our lightweight Download Manager, updates the subdirectory that will be created in the OS default music folder when the user downloads.
      # @option options [String] :plName
      #   If using our lightweight Download Manager, updates the playlist name that will appear if users choose to import downloaded media into iTunes or Windows Media Player.
      # @option options [String] :expires
      #   Updates the fixed date of when the download session token expires.
      # @option options [Int] :maxUses
      #   Updates the maximum amount of times this download session token is able to be used in an attempted download.
      #
      # @see http://documentation.vlgroup.com/downloads/introduction
      # return:
      # :token [string]	The download session token you should use in fulfilmment requests.	
      # :url		[String]	Base url where the customer’s download request should be directed.	
      #
      
      def download_update_session(options={})
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        options = options.merge(access_token: options[:access_token]) 
        self.endpoint = "#{DOWNLOAD_UPDATE_ENDPOINT}"
        get("UpdateDownloadSession", options)
      end
      
      #
      # This method to get a donlowad session info. After a download session has been created, if you want to check its status within our system for customer service or informational purposes
      #
      # Method: GetDownloadSessionInformation - used in auth token      
      #
      # @option options [String] :token
      #   The same download session token you used when calling this method.
      # @option options [Integer] :successfulServes
      #   The number of times our system has successfully served out the download session.
      # @option options [Integer] :failedServes
      #   The number of time our system has encountered an error that would caused files to not be served out.
      # @option options [String] :resetAmount
      #   The amount of times you have called UpdateDownloadSession (see below) and given the maxUses a new value, effectively resetting the download session.
      # @option options [String] :totalContentCount
      #   The total count of pieces of tracks contained in this download session. This expands album track counts, so if the download session contains an album with 15 tracks plus 3 "loose" tracks, the value of total_content_count will be 18.
      #
      # @see http://documentation.vlgroup.com/downloads/introduction
      # return:
      # :token [string]	The download session token you should use in fulfilmment requests.	
      # :url		[String]	Base url where the customer’s download request should be directed.	
      #
            
      def download_get_session_info(options={})
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        options = options.merge(access_token: options[:access_token]) 
        self.endpoint = "#{DOWNLOAD_GET_SESSION_INFO_ENDPOINT}"
        get("GetDownloadSessionInformation", options)
      end     

    end
  end
end
