require 'rails_helper'

RSpec.describe Messages::Translator do
  describe '#call' do
    let(:message) { 'message' }
    let(:dialect) { Dialect.list.sample }

    subject { described_class.new(message, dialect).call }

    it 'translates message correctly' do
      expect(Chat::API::Dialect).to receive(:translate).with(message, dialect)

      subject
    end
  end
end
