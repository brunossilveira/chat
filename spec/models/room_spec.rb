require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#validations' do
    it { should belong_to(:user) }
    it { should have_many(:messages) }
  end
end
