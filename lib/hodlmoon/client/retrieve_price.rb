require_relative 'base'

module Hodlmoon
  module Client
    class RetrievePrice < Base
      def self.call(coin, currency)
        new(coin: coin, currency: currency).call
      end

      def call
        response = HTTParty.get(uri)
        response.first[price_with_currency]
      end

      private

      def uri
        "https://api.coinmarketcap.com/v1/ticker/#{@coin}/?convert=#{@currency}"
      end

      def price_with_currency
        "price_#{@currency}"
      end
    end
  end
end
