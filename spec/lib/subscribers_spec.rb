require 'rails_helper'
require 'subscribers'

RSpec.describe Subscribers do
  let(:room) { 4 }

  before do
    Storage.storage.flushall
  end

  describe '.key' do
    subject { described_class.key(room) }

    it 'returns key correcly' do
      expect(subject).to eq("#{Subscribers::BASE_KEY}_#{room}")
    end
  end

  describe '.list' do
    let(:list) do
      [
        'a',
        'b'
      ]
    end

    subject { described_class.list(room) }

    before do
      list.each do |l|
        described_class.add(room, l)
      end
    end

    it 'returns key correcly' do
      expect(subject.first).to eq(list.first)
      expect(subject.last).to eq(list.last)
    end
  end

  describe '.remove' do
    let(:list) do
      [
        'a',
        'b'
      ]
    end

    before do
      list.each do |l|
        described_class.add(room, l)
      end
    end

    subject { described_class.remove(room, list.first) }

    it 'returns key correcly' do
      subject

      expect(described_class.list(room).count).to eq(1)
    end
  end

  describe '.add' do
    let(:value) { 'value' }

    subject { described_class.add(room, value) }

    it 'returns key correcly' do
      subject

      expect(described_class.list(room).first).to eq(value)
    end
  end
end
