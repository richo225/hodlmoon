require 'thor'
require 'hodlmoon/client/retrieve_price'
require 'hodlmoon/client/retrieve_list'
require 'hodlmoon/table'

module Hodlmoon
  class Cli < Thor
    DEFAULT_LIMIT = 8

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
      info = Hodlmoon::Client::RetrievePrice.call(coin, currency)

      if info.success?
        puts Hodlmoon::Table.build(info, currency)
      else
        puts 'Please input the full name of a valid coin.'
      end
    end

    desc 'list LIMIT CURRENCY', 'get LIMIT of top coins in CURRENCY(optional)'
    def list(limit = DEFAULT_LIMIT, currency = 'gbp')
      info = Hodlmoon::Client::RetrieveList.call(limit, currency)
      puts Hodlmoon::Table.build(info, currency)
    end
  end
end
