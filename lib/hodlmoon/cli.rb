require 'thor'
require 'hodlmoon/client/retrieve_price'
require 'hodlmoon/client/retrieve_list'
require 'hodlmoon/table'

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
      price = Hodlmoon::Client::RetrievePrice.call(coin, currency)
      puts "#{CURRENCY[currency.to_sym]}#{price}"
    end

    desc 'list LIMIT CURRENCY', 'get LIMIT of top coins in CURRENCY(optional)'
    def list(limit = 5, currency = 'gbp')
      info = Hodlmoon::Client::RetrieveList.call(limit, currency)
      Hodlmoon::Table.build(info)
    end
  end
end
