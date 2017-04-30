require 'rails_helper'
require 'storage'

RSpec.describe Storage do
  let(:key) { 'key' }
  let(:value) { 'value' }

  before do
    Storage.storage.flushall
  end

  describe '.get' do
    subject { described_class.get(key) }

    before do
      described_class.set(key, value)
    end

    it 'returns value correctly' do
      expect(subject).to eq(value)
    end
  end

  describe '.set' do
    subject { described_class.set(key, value) }

    it 'sets value correcly' do
      subject

      expect(described_class.get(key)).to eq(value)
    end
  end

  describe '.storage' do
    subject { described_class.storage }

    it 'returns an instance of Redis class' do
      expect(subject.class).to eq(Redis)
    end
  end
end
