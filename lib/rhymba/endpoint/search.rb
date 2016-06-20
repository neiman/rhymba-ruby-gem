module Rhymba
  module Endpoint
    module Search
      #
      # http://documentation.vlgroup.com/search/odata
      # This method allows to search albums
      #
      # @option options [Object] $callback
      #   Requires $format be set to json. This will modify the response from Rhymba to use JSONP format wrapped in a JavaScript call to the function specified by this value. This is used for Javascript-based interaction with the search APIs.
      # @option options [Object] $expand
      #   Allows you to display subproperties of the returned objects that are complex types and which are not returned by default.
      #   You must also include these subproperties in your $select statement.
      # @option options [Object] $filter
      #   The $filter parameter in the search API allows for advanced searching of content based on the properties of the collection objects. The properties & metadata are discussed in-depth in each collections' information page in this section.
      # @option options [Object] $format
      #   Required. Specify the format you'd like the data returned in. Valid options are json or atom.
      # @option options [Object] :id_cdl
      #   Integer array, comma-separated, with array wrapped in single quotes
      #   The id_cdl parameter is a custom OData query parameter we've implemented allowing you to retrieve several pieces of specific content by their Rhymba ID.
      # @option options [Object] $inlinecount
      #   When you include $inlinecount=allpages as a part of your URL query string, it instructs Rhymba's Search API to include a field with the total results found, regardless of any $top or $skip values specified.
      # @option options [Object] :keyword
      #   query.
      # @option options [Object] $select
      #   Required. Specific properties of the objects returned
      #   The id_cdl parameter is a custom OData query parameter we've implemented allowing you to retrieve several pieces of specific content by their Rhymba ID.
      # @option options [Object] $skip
      #   The number of results to skip
      # @option options [Object] $top
      #   Required. The number of results to retrieve.Used for paging.
      #
      # @see http://documentation.vlgroup.com/search/albums for properties of $select
      # example select values: id,name,artist_id,artist_name,numberoftracks 

      def search_album(options={})
        throw ArgumentError.new("Required arguments $format missing") if options["$format"].nil?
        throw ArgumentError.new("Required arguments $top missing") if options["$top"].nil?  
        throw ArgumentError.new("Required arguments $select missing") if options["$select"].nil?        
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        options = options.merge(access_token: self.access_token) 
        get("Albums()", options)
      end

      #
      # http://documentation.vlgroup.com/search/odata
      # This method allows to search media
      #
      # @option options [Object] $callback
      #   Requires $format be set to json. This will modify the response from Rhymba to use JSONP format wrapped in a JavaScript call to the function specified by this value. This is used for Javascript-based interaction with the search APIs.
      # @option options [Object] $expand
      #   Allows you to display subproperties of the returned objects that are complex types and which are not returned by default.
      #   You must also include these subproperties in your $select statement.
      # @option options [Object] $filter
      #   The $filter parameter in the search API allows for advanced searching of content based on the properties of the collection objects. The properties & metadata are discussed in-depth in each collections' information page in this section.
      # @option options [Object] $format
      #   Specify the format you'd like the data returned in. Valid options are json or atom.
      # @option options [Object] :id_cdl
      #   Integer array, comma-separated, with array wrapped in single quotes
      #   The id_cdl parameter is a custom OData query parameter we've implemented allowing you to retrieve several pieces of specific content by their Rhymba ID.
      # @option options [Object] $inlinecount
      #   When you include $inlinecount=allpages as a part of your URL query string, it instructs Rhymba's Search API to include a field with the total results found, regardless of any $top or $skip values specified.
      # @option options [Object] :keyword
      #   query. 
      # @option options [Object] $select
      #   Specific properties of the objects returned
      #   The id_cdl parameter is a custom OData query parameter we've implemented allowing you to retrieve several pieces of specific content by their Rhymba ID.
      # @option options [Object] $skip
      #   The number of results to skip
      # @option options [Object] $top
      #   The number of results to retrieve.Used for paging.
      #
      # @see http://documentation.vlgroup.com/search/media for properties of $select
      # example $slect values: id,title,artist_id,artist_name
      
      def search_media(options={})
        throw ArgumentError.new("Required arguments $format missing") if options["$format"].nil?
        throw ArgumentError.new("Required arguments $top missing") if options["$top"].nil?
        throw ArgumentError.new("Required arguments $select missing") if options["$select"].nil?         
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        options = options.merge(access_token: self.access_token) 
        
        get("Media()", options)
      end

      #
      # http://documentation.vlgroup.com/search/odata
      # This method allows to search artists
      #
      # @option options [Object] $callback
      #   Requires $format be set to json. This will modify the response from Rhymba to use JSONP format wrapped in a JavaScript call to the function specified by this value. This is used for Javascript-based interaction with the search APIs.
      # @option options [Object] $expand
      #   Allows you to display subproperties of the returned objects that are complex types and which are not returned by default.
      #   You must also include these subproperties in your $select statement.
      # @option options [Object] $filter
      #   The $filter parameter in the search API allows for advanced searching of content based on the properties of the collection objects. The properties & metadata are discussed in-depth in each collections' information page in this section.
      # @option options [Object] $format
      #   Specify the format you'd like the data returned in. Valid options are json or atom.
      # @option options [Object] :id_cdl
      #   Integer array, comma-separated, with array wrapped in single quotes
      #   The id_cdl parameter is a custom OData query parameter we've implemented allowing you to retrieve several pieces of specific content by their Rhymba ID.
      # @option options [Object] $inlinecount
      #   When you include $inlinecount=allpages as a part of your URL query string, it instructs Rhymba's Search API to include a field with the total results found, regardless of any $top or $skip values specified.
      # @option options [Object] :keyword
      #   query.
      # @option options [Object] $select
      #   Specific properties of the objects returned
      #   The id_cdl parameter is a custom OData query parameter we've implemented allowing you to retrieve several pieces of specific content by their Rhymba ID.
      # @option options [Object] $skip
      #   The number of results to skip
      # @option options [Object] $top
      #   The number of results to retrieve.Used for paging.
      #
      # @see hhttp://documentation.vlgroup.com/search/artists for properties of $select  
      # example $select values: id,name,genres
      
      def search_artist(options={})
        throw ArgumentError.new("Required arguments $format missing") if options["$format"].nil?
        throw ArgumentError.new("Required arguments $top missing") if options["$top"].nil?
        throw ArgumentError.new("Required arguments $select missing") if options["$select"].nil? 
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        options = options.merge(access_token: self.access_token) 
        get("Artists()", options)
      end

    end
  end
end
