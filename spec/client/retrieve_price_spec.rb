RSpec.describe Hodlmoon::Client::RetrievePrice do
  describe '#call', :vcr do
    subject(:client) { described_class.call('ethereum', currency).first }

    it 'returns the correct headers' do
      expect(client.keys).to include(
        'current_price',
        'price_change_percentage_24h',
        'market_cap_rank'
      )
    end
  end
end
