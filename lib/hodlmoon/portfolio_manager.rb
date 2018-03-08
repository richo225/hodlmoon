module Hodlmoon
  class PortfolioManager
    def self.import_portfolio(path, currency)
      new(path, currency).import_portfolio
    end

    def initialize(path, currency)
      @path = path
      @currency = currency
    end

    def import_portfolio
      portfolio.map do |coin|
        Hodlmoon::Client::RetrievePrice.call(coin, @currency)
      end.flatten
    end

    private

    def portfolio
      CSV.read(@path).flatten
    end
  end
end
