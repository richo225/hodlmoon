require 'httparty'

module Hodlmoon
  module Client
    class CoinMarketCap
      def self.retrieve_price(coin, currency)
        new(coin: coin, currency: currency).retrieve_price
      end

      def self.retrieve_info(limit, currency)
        new(limit: limit, currency: currency).retrieve_info
      end

      def initialize(limit: nil, coin: nil, currency:)
        @limit = limit
        @coin = coin
        @currency = currency
      end

      def retrieve_price
        response = HTTParty.get(price_uri)
        response.first[price_with_currency]
      end

      def retrieve_info
        HTTParty.get(list_uri)
      end

      private

      def price_uri
        "https://api.coinmarketcap.com/v1/ticker/#{@coin}/?convert=#{@currency}"
      end

      def list_uri
        "https://api.coinmarketcap.com/v1/ticker?limit=#{@limit}&convert=#{@currency}"
      end

      def price_with_currency
        "price_#{@currency}"
      end
    end
  end
end
