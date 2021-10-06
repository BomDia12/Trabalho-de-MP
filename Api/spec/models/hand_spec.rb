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

    context 'when hand doesn´t have a card' do
      it { expect(build(:hand, card_a: nil)).to be_invalid }
      it { expect(build(:hand, card_b: nil)).to be_invalid }
      it { expect(build(:hand, card_c: nil)).to be_invalid }
      it { expect(build(:hand, card_a: nil, card_b: nil,card_c: nil)).to be_invalid }
    end

    context 'when player is invalid' do
      it { expect(build(:hand, player: nil)).to be_invalid }
      it { expect(build(:hand, player: -1)).to be_invalid }
      it { expect(build(:hand, player: 4)).to be_invalid }
    end
  end

end
