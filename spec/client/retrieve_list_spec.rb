RSpec.describe Hodlmoon::Client::RetrieveList do
  describe '#call', :vcr do
    subject(:client) { described_class.call(12, 'gbp') }

    it 'returns the correct limit' do
      expect(client.count).to eq(12)
    end

    it 'returns the correct headers' do
      expect(client.first.keys).to include(
        'current_price',
        'price_change_percentage_24h',
        'market_cap_rank'
      )
    end
  end
end
