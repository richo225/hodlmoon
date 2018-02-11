require 'formatador'

module Hodlmoon
  class Table
    def self.build(info)
      new(info).build
    end

    def initialize(info)
      @info = info
    end

    def build
      Formatador.display_table(filtered_info, headers)
    end

    private

    def filtered_info
      @info.map { |coin| coin.slice(*headers) }
    end

    def headers
      ['name', 'symbol', 'price_gbp', 'market_cap_gbp', 'percent_change_1h', 'percent_change_24h', 'percent_change_7d']
    end
  end
end
