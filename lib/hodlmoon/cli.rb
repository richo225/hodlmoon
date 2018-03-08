require 'thor'
require 'launchy'
require 'hodlmoon/client/retrieve_price'
require 'hodlmoon/client/retrieve_list'
require 'hodlmoon/table'

module Hodlmoon
  class Cli < Thor
    DEFAULT_LIMIT = 8
    COINSPECTATOR_URL = 'https://coinspectator.com/'.freeze
    ETHTRADER_URL = 'https://www.reddit.com/r/ethtrader/'.freeze

    desc 'hello NAME', 'say hello to NAME'
    def hello(name)
      puts "Hello #{name}"
    end

    desc 'version', 'Display hodlmoon version'
    map %w(-v --version) => :version
    def version
      say "Hodlmoon #{VERSION}"
    end

    desc 'news', 'link to CoinSpectator'
    map %w(-n --news) => :news
    def news
      Launchy.open(COINSPECTATOR_URL)
    end

    desc 'trader', 'link to r/EthTrader'
    map %w(-t --trader) => :trader
    def trader
      Launchy.open(ETHTRADER_URL)
    end

    desc 'price COIN CURRENCY', 'get current price of COIN in CURRENCY(optional)'
    map %w(-p --price) => :price
    def price(coin, currency = 'gbp')
      info = Hodlmoon::Client::RetrievePrice.call(coin, currency)

      if info.success?
        puts Hodlmoon::Table.build(info, currency)
      else
        puts 'Please input the full name of a valid coin.'
      end
    end

    desc 'list LIMIT CURRENCY', 'get LIMIT of top coins in CURRENCY(optional)'
    map %w(-l --list) => :list
    def list(limit = DEFAULT_LIMIT, currency = 'gbp')
      info = Hodlmoon::Client::RetrieveList.call(limit, currency)
      puts Hodlmoon::Table.build(info, currency)
    end
  end
end
