require 'rails_helper'

RSpec.describe Hand, type: :model do
  describe 'factory' do
    context 'when using classic factory_bot' do
      it { expect(build(:hand)).to be_valid }
    end
  end

  describe 'validations' do
    context 'when hand has no round' do
      it { expect(build(:hand, round_id: nil)).to be_invalid }
    end
  end

end
