require 'rails_helper'
require 'api/dialect'

RSpec.describe Chat::API::Dialect do
  describe '.translate' do
    let(:message) { 'message' }
    let(:dialect) { 'dialect' }

    subject { described_class.translate(message, dialect) }

    it 'calls api and returns response object' do
      expect(subject.class).to eq(Chat::API::Response)
    end
  end
end
