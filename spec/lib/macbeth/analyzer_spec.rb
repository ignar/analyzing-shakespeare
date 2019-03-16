require 'spec_helper'

RSpec.describe Macbeth::Analyzer do
  describe '#counter' do
    it { expect(subject).to respond_to(:counter) }
    it { expect(subject.counter).to be_kind_of(Hash) }
    it { expect(subject.counter['Foo']).to eq(0) }
  end

  describe '#add' do
    it 'adds line to counter' do
      subject.add('FOO')
      expect(subject.counter['Foo']).to eq(1)
    end

    it 'normalizes name' do
      subject.add('bAR')
      subject.add('BaR')
      expect(subject.counter['Bar']).to eq(2)
    end

    it 'returns number of occurrences' do
      subject.add('BAR')
      subject.add('BAR')
      expect(subject.counter['Bar']).to eq(2)
    end

    it 'ignores ALL' do
      subject.add('ALL')
      expect(subject.counter).to be_empty
    end
  end

  describe '#each' do
    it 'returns enumerator' do
      expect(subject.each).to be_kind_of(Enumerator)
    end

    it 'returns elements in order' do
      8.times { subject.add('name 1') }
      subject.add('name 2')
      enum = subject.each
      expect(enum.next).to eq(['Name 1', 8])
      expect(enum.next).to eq(['Name 2', 1])
    end
  end
end
