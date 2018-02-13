RSpec.describe Hodlmoon::Client::RetrievePrice do
  describe '#call', :vcr do
    subject(:client) { described_class.call('ethereum', currency).first }

    context 'with gbp' do
      let(:currency) { 'gbp' }

      it 'returns the gbp headers' do
        expect(client.keys).to include('price_gbp', '24h_volume_gbp', 'market_cap_gbp')
      end

      it 'returns the current coin price in pounds' do
        expect(client['price_gbp']).to eq('580.697337402')
      end
    end

    context 'with usd' do
      let(:currency) { 'usd' }

      it 'returns the usd headers' do
        expect(client.keys).to include('price_usd', '24h_volume_usd', 'market_cap_usd')
      end

      it 'returns the current coin price in dollars' do
        expect(client['price_usd']).to eq('808.738')
      end
    end
  end
end
