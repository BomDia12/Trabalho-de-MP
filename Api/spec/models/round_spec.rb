# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Round, type: :model do
  describe 'factory' do
    it { expect(build(:round)).to be_valid }
  end

  describe 'validations' do
    context 'when has an empty field' do
      it { expect(build(:round, game_id: nil)).to be_invalid }
      it { expect(build(:round, points_a: nil)).to be_invalid }
      it { expect(build(:round, points_b: nil)).to be_invalid }
      it { expect(build(:round, multiplier: nil)).to be_invalid }
      it { expect(build(:round, turn: nil)).to be_invalid }
    end

    context 'when points are invalid' do
      it { expect(build(:round, points_a: -1)).to be_invalid }
      it { expect(build(:round, points_a: 3)).to be_invalid }
      it { expect(build(:round, points_b: -1)).to be_invalid }
      it { expect(build(:round, points_b: 3)).to be_invalid }
    end

    context 'when points are float' do
      let(:rodada) { build(:round, points_a: 1.5, points_b: 2.7) }
      it { expect(rodada.points_a).to eq(1) }
      it { expect(rodada.points_b).to eq(2) }
    end

    context 'when points are valid' do
      it { expect(build(:round, points_a: 2)).to be_valid }
      it { expect(build(:round, points_a: 0)).to be_valid }
      it { expect(build(:round, points_b: 2)).to be_valid }
      it { expect(build(:round, points_b: 0)).to be_valid }
    end

    context 'when multiplier is invalid' do
      it { expect(build(:round, multiplier: 2)).to be_invalid }
      it { expect(build(:round, multiplier: 0)).to be_invalid }
      it { expect(build(:round, multiplier: -3)).to be_invalid }
      it { expect(build(:round, multiplier: 10)).to be_invalid }
    end

    context 'when multiplier is valid' do
      it { expect(build(:round, multiplier: 1)).to be_valid }
      it { expect(build(:round, multiplier: 3)).to be_valid }
      it { expect(build(:round, multiplier: 6)).to be_valid }
      it { expect(build(:round, multiplier: 9)).to be_valid }
      it { expect(build(:round, multiplier: 12)).to be_valid }
    end

    context 'when multiplier_turn is invalid' do
      it { expect(build(:round, multiplier_turn: 7)).to be_invalid }
      it { expect(build(:round, multiplier_turn: -1)).to be_invalid }
    end

    context 'when multiplier_turn is valid' do
      it { expect(build(:round, multiplier_turn: 0)).to be_valid }
      it { expect(build(:round, multiplier_turn: 1)).to be_valid }
      it { expect(build(:round, multiplier_turn: 2)).to be_valid }
      it { expect(build(:round, multiplier_turn: 3)).to be_valid }
    end

    context 'when turn is invalid' do
      it { expect(build(:round, turn: -4)).to be_invalid }
      it { expect(build(:round, turn: 4)).to be_invalid }
    end

    context 'when turn is valid' do
      it { expect(build(:round, turn: 0)).to be_valid }
      it { expect(build(:round, turn: 1)).to be_valid }
      it { expect(build(:round, turn: 2)).to be_valid }
      it { expect(build(:round, turn: 3)).to be_valid }
    end
  end
end
