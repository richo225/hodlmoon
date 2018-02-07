require "hodlmoon/version"
require 'hodlmoon/coin_market_cap_client'

module Hodlmoon
  def self.price(coin)
    CoinMarketCapClient.get_price(coin)
  end
end
