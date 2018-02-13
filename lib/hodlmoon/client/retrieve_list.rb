require_relative 'base'

module Hodlmoon
  module Client
    class RetrieveList < Base
      def self.call(limit, currency)
        new(limit: limit, currency: currency).call
      end

      private

      def uri
        "https://api.coinmarketcap.com/v1/ticker/?limit=#{@limit}&convert=#{@currency}"
      end
    end
  end
end
