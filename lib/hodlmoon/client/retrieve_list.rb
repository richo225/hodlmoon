require_relative 'base'

module Hodlmoon
  module Client
    class RetrieveList < Base
      def self.call(limit, currency)
        new(limit: limit, currency: currency).call
      end

      private

      def uri
        "https://api.coingecko.com/api/v3/coins/markets?per_page=#{@limit}&vs_currency=#{@currency}"
      end
    end
  end
end
