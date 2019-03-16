require 'spec_helper'

RSpec.describe Macbeth::Reporter do
  let(:analyzer) { double(:analyzer) }
  let(:io) { double(:reporter) }

  before(:each) do
    allow(analyzer).to receive(:each)
                         .and_yield('Actor 1', 10)
                         .and_yield('Actor 2', 20)
  end

  describe '#report' do
    it { expect(described_class).to respond_to(:report) }

    it 'prints out result' do
      expect(io).to receive(:write).twice
      described_class.report(analyzer, io)
    end
  end
end
