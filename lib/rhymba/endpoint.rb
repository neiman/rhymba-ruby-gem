#
require_relative 'endpoint/download'
require_relative 'endpoint/purchases'
require_relative 'endpoint/stream'
require_relative 'endpoint/auth'
require_relative 'endpoint/search'

module Rhymba
  module Endpoint
    include Download
    include Purchases
    include Stream
    include Auth
    include Search
  end
end
