require 'terminal-table'

module Hodlmoon
  class Table
    def self.build(info, currency)
      new(info, currency).build
    end

    def initialize(info, currency)
      @info = info
      @currency = currency
    end

    def build
      Terminal::Table.new do |t|
        t.title =  '☾   ☾   ☾   Hodlmoon   ☽   ☽   ☽'
        t.headings = humanised_headings
        t.rows = rows
        t.style = { all_separators: true, border_x: '=', border_i: 'O', alignment: :center }
      end
    end

    private

    def headings
      ['market_cap_rank',
       'name',
       'symbol',
       'current_price',
       'market_cap',
       'price_change_percentage_24h',
       'ath_change_percentage']
    end

    def humanised_headings
      headings.map do |heading|
        heading.tr('_', ' ').capitalize
      end
    end

    def rows
      colorised_info.map(&:values)
    end

    def colorised_info
      filtered_info.map do |coin|
        coin.transform_values!(&:to_s)
            .each_pair { |k, v| colorise(k, v) }
      end
    end

    def filtered_info
      @info.map do |coin|
        headings.each_with_object({}) { |k, h| h[k] = coin[k]; }
      end
    end

    def colorise(key, value)
      return unless value

      case key
      when /_price_.*/ then colorise_yellow(value)
      when /_percentage.*/ then colorise_red_or_green(value)
      end
    end

    def colorise_yellow(string)
      string.prepend("\e[33m").concat("\e[0m")
    end

    def colorise_red_or_green(string)
      string.include?('-') ? colorise_red(string) : colorise_green(string)
    end

    def colorise_red(string)
      string.prepend("\e[31m").concat("\e[0m")
    end

    def colorise_green(string)
      string.prepend("\e[32m+").concat("\e[0m")
    end
  end
end
