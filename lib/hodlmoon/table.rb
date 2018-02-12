require 'terminal-table'

module Hodlmoon
  class Table
    def self.build(info)
      new(info).build
    end

    def initialize(info)
      @info = info
    end

    def build
      Terminal::Table.new do |t|
        t.headings = headers
        t.rows = colorised_rows
        t.style = { all_separators: true, border_x: '=', border_i: 'O', alignment: :center }
      end
    end

    private

    def headers
      ['name', 'symbol', 'price_gbp', 'market_cap_gbp', 'percent_change_1h', 'percent_change_24h', 'percent_change_7d']
    end

    def colorised_rows
      rows.each do |row|
        colorise_yellow(row[2])
        row[-1].include?('-') ? colorise_red(row[-1]) : colorise_green(row[-1])
        row[-2].include?('-') ? colorise_red(row[-2]) : colorise_green(row[-2])
        row[-3].include?('-') ? colorise_red(row[-3]) : colorise_green(row[-3])
      end
    end

    def rows
      filtered_info.map(&:values)
    end

    def filtered_info
      @info.map do |coin|
        headers.each_with_object({}) { |k, h| h[k] = coin[k]; }
      end
    end

    def colorise_yellow(string)
      string.prepend("\e[33m").concat("\e[0m")
    end

    def colorise_red(string)
      string.prepend("\e[31m").concat("\e[0m")
    end

    def colorise_green(string)
      string.prepend("\e[32m+").concat("\e[0m")
    end
  end
end
