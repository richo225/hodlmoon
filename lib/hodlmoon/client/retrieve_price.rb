require_relative 'base'

module Hodlmoon
  module Client
    class RetrievePrice < Base
      def self.call(coin, currency)
        new(coin: coin, currency: currency).call
      end

      private

      def uri
        "https://api.coingecko.com/api/v3/coins/markets?ids=#{@coin}&vs_currency=#{@currency}"
      end
    end
  end
end
