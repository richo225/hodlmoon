require 'httparty'

module Hodlmoon
  module Client
    class CoinMarketCap
      def self.retrieve_price(coin, currency)
        new(coin, currency).retrieve_price
      end

      def initialize(coin, currency)
        @coin = coin
        @currency = currency
      end

      def retrieve_price
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
