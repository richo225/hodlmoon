require 'thor'
require 'hodlmoon/client/coin_market_cap'

module Hodlmoon
  class Cli < Thor
    CURRENCY = {
      gbp: '£',
      usd: '$',
      eur: '€'
    }.freeze

    desc 'hello NAME', 'say hello to NAME'
    def hello(name)
      puts "Hello #{name}"
    end

    desc 'price COIN CURRENCY', 'get current price of COIN in CURRENCY(optional)'
    def price(coin, currency = 'gbp')
      price = Hodlmoon::Client::CoinMarketCap.retrieve_price(coin, currency)
      puts "#{CURRENCY[currency.to_sym]}#{price}"
    end

    desc 'list LIMIT CURRENCY', 'get LIMIT of top coins in CURRENCY(optional)'
    def list(limit = 10, currency = 'gbp')
      info = Hodlmoon::Client::CoinMarketCap.retrieve_info(limit, currency)
      puts info
    end
  end
end
