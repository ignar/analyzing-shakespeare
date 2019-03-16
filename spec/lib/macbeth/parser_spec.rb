require 'spec_helper'

RSpec.describe Macbeth::Parser do
  let(:path) { File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'macbeth.xml')) }
  let(:source_io) { File.open(path) }

  let(:analyzer) { double(:analyzer) }

  before(:each) do
    allow(analyzer).to receive(:add).and_return(true)
  end

  subject { described_class.new(source_io, analyzer) }

  describe '#parse' do
    it { expect(subject.parse).to be(analyzer) }
  end
end
