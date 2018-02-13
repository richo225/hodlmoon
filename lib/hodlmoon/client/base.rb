require 'httparty'

module Hodlmoon
  module Client
    class Base
      def initialize(limit: nil, coin: nil, currency:)
        @limit = limit
        @coin = coin
        @currency = currency
      end

      def call
        HTTParty.get(uri)
      end

      private

      def uri
        raise NotImplementedError
      end
    end
  end
end
