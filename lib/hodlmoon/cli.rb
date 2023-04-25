require 'thor'
require 'launchy'
require 'hodlmoon/client/retrieve_price'
require 'hodlmoon/client/retrieve_list'
require 'hodlmoon/table'
require 'hodlmoon/portfolio_manager'

module Hodlmoon
  class Cli < Thor
    DEFAULT_LIMIT = 8
    DEFAULT_CURRENCY = 'gbp'.freeze
    COINSPECTATOR_URL = 'https://coinspectator.com/'.freeze
    ETHTRADER_URL = 'https://www.reddit.com/r/ethtrader/'.freeze
    DEFAULT_PORTFOLIO_PATH = '~/hodlmoon_portfolio'.freeze

    def self.exit_on_failure?
      true
    end

    desc 'hello NAME', 'say hello to NAME'
    def hello(name)
      say "Hello #{name}"
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

    desc 'create_portfolio', 'create your coin portfolio'
    def create_portfolio
      say "Creating file at #{DEFAULT_PORTFOLIO}"
      @coins = []
      loop do
        coin = ask("Please input your coins eg.'ethereum' :")
        break if coin.empty?

        @coins << coin
      end
      CSV.open(DEFAULT_PORTFOLIO_PATH, 'wb') do |csv|
        csv << @coins
      end
      say 'Portfolio successfully created'
    end

    desc 'portfolio PATH CURRENCY', 'Get data for your portfolio at csv PATH'
    map %w(-p --portfolio) => :portfolio
    def portfolio(path, currency = DEFAULT_CURRENCY)
      raise Error, set_color("No such file exists at #{path}", :red) unless File.exist?(path)

      info = Hodlmoon::PortfolioManager.import_portfolio(path, currency)
      puts Hodlmoon::Table.build(info, currency)
    end

    desc 'price COIN CURRENCY', 'get current price of COIN in CURRENCY(optional)'
    map %w(-p --price) => :price
    def price(coin, currency = DEFAULT_CURRENCY)
      info = Hodlmoon::Client::RetrievePrice.call(coin, currency)
      raise_info_error(info)

      puts Hodlmoon::Table.build(info, currency)
    end

    desc 'list LIMIT CURRENCY', 'get LIMIT of top coins in CURRENCY(optional)'
    map %w(-l --list) => :list
    def list(limit = DEFAULT_LIMIT, currency = DEFAULT_CURRENCY)
      info = Hodlmoon::Client::RetrieveList.call(limit, currency)
      raise_info_error(info)

      puts Hodlmoon::Table.build(info, currency)
    end

    private

    def raise_info_error(info)
      raise Error, set_color('Sorry, the rate limit has been exceeded', :red) if info.response.code == '429'
      raise Error, set_color('Please input the full name of a valid coin.', :red) if !info.success? || info.empty?
    end
  end
end
