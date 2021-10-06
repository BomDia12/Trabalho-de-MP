require 'rails_helper'

RSpec.describe Hand, type: :model do
  describe 'factory' do
    context 'when using classic factory_bot'
    it { expect(build(:hand)).to be_valid }
  end
end
