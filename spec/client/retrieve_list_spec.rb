RSpec.describe Hodlmoon::Client::RetrieveList do
  describe '#call', :vcr do
    subject(:client) { described_class.call(12, currency) }

    context 'with gbp' do
      let(:currency) { 'gbp' }

      it 'returns the correct limit' do
        expect(client.count).to eq(12)
      end

      it 'returns the gbp headers' do
        expect(client.first.keys).to include('price_gbp', '24h_volume_gbp', 'market_cap_gbp')
      end
    end

    context 'with usd' do
      let(:currency) { 'usd' }

      it 'returns the correct limit' do
        expect(client.count).to eq(12)
      end

      it 'returns the usd headers' do
        expect(client.first.keys).to include('price_usd', '24h_volume_usd', 'market_cap_usd')
      end
    end
  end
end
