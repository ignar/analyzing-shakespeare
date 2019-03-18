require 'spec_helper'

RSpec.describe Macbeth::Analyzer do
  describe '#counter' do
    it { expect(subject).to respond_to(:counter) }
    it { expect(subject.counter).to be_kind_of(Hash) }
    it { expect(subject.counter['Foo']).to eq(0) }
  end

  describe '#add' do
    it 'adds line to counter' do
      subject.add(speaker: 'FOO', count: 1)
      expect(subject.counter['Foo']).to eq(1)
    end

    it 'normalizes name' do
      subject.add(speaker: 'bAR', count: 1)
      subject.add(speaker: 'BaR', count: 1)
      expect(subject.counter['Bar']).to eq(2)
    end

    it 'returns number of occurrences' do
      subject.add(speaker: 'BAR', count: 1)
      subject.add(speaker: 'BAR', count: 1)
      expect(subject.counter['Bar']).to eq(2)
    end

    it 'ignores ALL' do
      subject.add(speaker: 'ALL', count: 1)
      expect(subject.counter).to be_empty
    end
  end

  describe '#each' do
    it 'returns enumerator' do
      expect(subject.each).to be_kind_of(Enumerator)
    end

    it 'returns elements in order' do
      8.times { subject.add(speaker: 'name 1', count: 1) }
      subject.add(speaker: 'name 2', count: 1)
      enum = subject.each
      expect(enum.next).to eq(['Name 1', 8])
      expect(enum.next).to eq(['Name 2', 1])
    end
  end
end
