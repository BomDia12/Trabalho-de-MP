require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'factory' do
    it { expect(build(:game)).to be_valid }
  end

  describe 'validations' do
    context 'when has an empty field' do
      it { expect(build(:game, point_a: nil)).to be_invalid }
      it { expect(build(:game, point_b: nil)).to be_invalid }
    end

    context 'when points are invalid' do
      it { expect(build(:game, point_a: -1)).to be_invalid }
      it { expect(build(:game, point_a: 13)).to be_invalid }
      it { expect(build(:game, point_b: -1)).to be_invalid }
      it { expect(build(:game, point_b: 13)).to be_invalid }
    end

    context 'when points are valid' do
      it { expect(build(:game, point_a: 12)).to be_valid }
      it { expect(build(:game, point_a: 0)).to be_valid }
      it { expect(build(:game, point_b: 12)).to be_valid }
      it { expect(build(:game, point_b: 0)).to be_valid }
    end
  end
end
