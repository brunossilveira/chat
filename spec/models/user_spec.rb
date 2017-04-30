require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    it { should have_many(:rooms) }
    it { should have_many(:messages) }
    it { should validate_presence_of(:dialect) }
  end
end
