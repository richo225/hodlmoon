require_relative 'base'

module Hodlmoon
  module Client
    class RetrievePrice < Base
      def self.call(coin, currency)
        new(coin: coin, currency: currency).call
      end

      private

      def uri
        "https://api.coinmarketcap.com/v1/ticker/#{@coin}/?convert=#{@currency}"
      end
    end
  end
end
