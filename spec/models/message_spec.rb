require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#validations' do
    it { should belong_to(:user) }
    it { should belong_to(:room) }
    it { should validate_presence_of(:body) }
  end

  describe '.timestamp' do
    let(:message) { Fabricate(:message) }

    it 'formats create_at correctly' do
      expect(message.timestamp).to eq(message.created_at.strftime('%H:%M:%S %d/%m/%Y'))
    end
  end
end
