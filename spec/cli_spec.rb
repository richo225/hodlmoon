RSpec.describe Hodlmoon::Cli do
  subject(:cli) { described_class.new }

  describe '#hello' do
    it { expect { cli.hello('Emilio') }.to output("Hello Emilio\n").to_stdout }
  end
end
