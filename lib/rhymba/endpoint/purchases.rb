
module Rhymba
  module Endpoint
    module Purchases
      
      PURCHASES_VERIFY_ENDPOINT = "https://purchases.mcnemanager.com/Purchases.svc/"
      PURCHASES_REPORT_ENDPOINT = "https://purchases.mcnemanager.com/Purchases.svc/ReportPurchase/"
      
      #
      # This GetInvalidItems method in the Purchases API validates a list of content against your system/application's whitelist rules, the content's delivery rules & current status, and confirms that the information you're going to pass to us is all up to snuff.
      #
      # Method: GetInvalidItems - used in auth token      
      #
      # @option options [Object] :access_hint
      #   Required. The access_hint value returned from the creation of the request token.	
      # @option options [Object] :access_req
      #   Required. The access_req value returned from the creation of the request token.	
      # @option options [Object] :access_token
      #   Required. The access_token value returned from the creation of the request token, not your regular access token.
      # @option options [Object] $format
      #   Required. Specify the format to return the data in. If this is missing or blank, 'atom' will be used.	json
      # @option options [string] :countryCode
      #   Required. 2-letter country where the download will take place	US
      # @option options [string] :purchasedItems
      #   Required. array of the content you're attempting to validate as well as the purchase details
      
      # POST DATA: purchasedItems Collection
      #    As a part of your POST, you should pass an array of the content you're attempting to validate as well as the purchase details. It's in the following JSON structure:
      #    
      # [
      #   {
      #      "contenttype": 1,
      #      "productid": 2307961,
      #      "retail": 9.99,
      #      "tax": 0,
      #      "discountamount": 0,
      #      "saletype": 0,
      #      "deliverytype": 2,
      #      "promotiondescription": null,
      #      "servicetype": 0,
      #      "quantity": 1
      #   },
      #   {
      #      "contenttype": 0,
      #      "productid": 2307959,
      #      "retail": 0.99,
      #      "tax": 0,
      #      "discountamount": 0.10,
      #      "saletype": 0,
      #      "deliverytype": 2,
      #      "promotiondescription": "Winter Sale",
      #      "servicetype": 0,
      #      "quantity": 1
      #   },
      #   etc...
      # ]
      #
      # fields for entries in the purchasedItems collection.
      #
      # @option options [Integer] :contenttype
      #   The type of this content item being purchased:
      #      0. Media / track
      #      1. Album
      # @option options [Integer] :productid
      #   VL Group's content ID, either a media ID or album ID, for this track or album; it can be found as the "id" field in an Album or Media object returned from the Search API.
      # @option options [Decimal] :retail
      #   The price of sale for this specific item, excluding any taxes.	
      # @option options [Decimal] :tax
      #   Amount of taxes to be charged to the end user for this single item.
      # @option options [Decimal] :discountamount
      #   What, if any, discount the user received vs. our suggested retail price. If this is non-zero, you must provide a promotiondescription.
      # @option options [Integer] :saletype
      #   The type of the sale; this will be 0 for all digital download sales, which is the most common, but other values include:
      #     0. Digital Download
      #     1. Playlist
      #     2. Ringtone
      #     3. Promotional giveaway (differs from a free digital download!)
      #     4. Non-compulsory stream
      #     5. Compulsory license-based stream
      # @option options [Int] :deliverytype
      #   How the content is to be/was delivered. Most implementations will use 2, but the options are:
      #     0. Mobile
      #     1. Kiosk
      #     2. Web
      #     3. Stream (non-web)
      # @option options [Int] :promotiondescription
      #   If discountamount is not 0.00, a textual description of why the content was discounted, such as a discount code used. Otherwise, this should be null.
      # @option options [Int] :servicetype
      #   The store/service sale type. Almost all implementations are 0, Pay Per Use.
      #      0. Pay Per Use (PPU)
      #      1. Subscription
      # @option options [Int] :quantity
      #   Quantity of this single item sold. Usually 1.
      #
      # @see http://documentation.vlgroup.com/purchases/verifying
      #
      # JSON INVLIAD return:
      # {
      #    "odata.metadata": "https://purchases.mcnemanager.com/Purchases.svc/$metadata#Collection(PurchaseDataProvider.ItemCheck)",
      #    "value":
      #    [
      #       {
      #          "id":2307961,
      #          "saletype": "digitaldownload",
      #          "contenttype": "album",
      #          "allowed": false,
      #          "message": "Album not allowed for sale type in region"
      #       }
      #    ]
      # }
      #
      # JSON VALID return:
      # {
      #    "odata.metadata": "https://purchases.mcnemanager.com/Purchases.svc/$metadata#Collection(PurchaseDataProvider.ItemCheck)",
      #    "value":[]
      # }


      def purchases_verify(options={})
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        options = options.merge(access_token: options[:access_token]) 
        self.endpoint = "#{PURCHASES_VERIFY_ENDPOINT}"
        post("GetInvalidItems", options)
      end
      
      #
      # This ReportPurchase method to report purchases
      # Method: ReportPurchase - used in auth token      
      #
      # @option options [Object] :access_hint
      #   Required. The access_hint value returned from the creation of the request token.	
      # @option options [Object] :access_req
      #   Required. The access_req value returned from the creation of the request token.	
      # @option options [Object] :access_token
      #   Required. The access_token value returned from the creation of the request token, not your regular access token.
      #
      # @see http://documentation.vlgroup.com/purchases/reporting
      #
      def purchases_report(options={})
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        options = options.merge(access_token: options[:access_token]) 
        self.endpoint = "#{PURCHASES_REPORT_ENDPOINT}"
        post("ReportPurchase", options)
      end
      
      #
      # This ReportPurchase method to report purchases
      # Method: ReportPurchase - used in auth token      
      #
      # @option options [Object] :access_hint
      #   Required. The access_hint value returned from the creation of the request token.	
      # @option options [Object] :access_req
      #   Required. The access_req value returned from the creation of the request token.	
      # @option options [Object] :access_token
      #   Required. The access_token value returned from the creation of the request token, not your regular access token.
      #
      # @see http://documentation.vlgroup.com/purchases/reporting
      #

      def purchases_report_finalize(options={})
        options[:attachments] = options[:attachments].to_json if Hash === options[:attachments]
        options = options.merge(access_token: options[:access_token]) 
        self.endpoint = "#{PURCHASES_REPORT_ENDPOINT}"
        post("FinalizePurchase", options)
      end


    end
  end
end
