require 'httparty'

class CryptoClient
  def self.get_price(coin)
    HTTParty.get("https://api.coinmarketcap.com/v1/ticker/#{coin}")
  end
end
