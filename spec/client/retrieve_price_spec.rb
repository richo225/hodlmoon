RSpec.describe Hodlmoon::Client::RetrievePrice do
  describe '#call', :vcr do
    subject(:client) { described_class.call('ethereum', currency) }

    context 'with gbp' do
      let(:currency) { 'gbp' }

      it 'returns the current coin price in pounds' do
        expect(client).to eq('580.697337402')
      end
    end

    context 'with usd' do
      let(:currency) { 'usd' }

      it 'returns the current coin price in dollars' do
        expect(client).to eq('808.738')
      end
    end
  end
end
