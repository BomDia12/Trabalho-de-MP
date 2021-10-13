# frozen_string_literal: true

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
      it { expect(build(:hand, card_a: nil)).to be_valid }
      it { expect(build(:hand, card_b: nil)).to be_valid }
      it { expect(build(:hand, card_c: nil)).to be_valid }
      it { expect(build(:hand, card_a: nil, card_b: nil, card_c: nil)).to be_valid }
    end

    context 'when player is invalid' do
      it { expect(build(:hand, player: nil)).to be_invalid }
      it { expect(build(:hand, player: -1)).to be_invalid }
      it { expect(build(:hand, player: 4)).to be_invalid }
    end

    context 'when player is valid' do
      it { expect(build(:hand, player: 0)).to be_valid }
      it { expect(build(:hand, player: 1)).to be_valid }
      it { expect(build(:hand, player: 2)).to be_valid }
      it { expect(build(:hand, player: 3)).to be_valid }
    end

    context 'when card has no suit' do
      it { expect(build(:hand, card_a: 'naipe 3')).to be_invalid }
      it { expect(build(:hand, card_b: 'naipe 2')).to be_invalid }
      it { expect(build(:hand, card_c: 'naipe 7')).to be_invalid }
    end

    context 'when card number is invalid' do
      it { expect(build(:hand, card_a: '♠ 5')).to be_invalid }
      it { expect(build(:hand, card_a: '♠ 6')).to be_invalid }
      it { expect(build(:hand, card_a: '♠ 8')).to be_invalid }
      it { expect(build(:hand, card_a: '♠ 9')).to be_invalid }
      it { expect(build(:hand, card_a: '♠ 10')).to be_invalid }
    end

    context 'when card has more than a number and a suit' do
      it { expect(build(:hand, card_a: '♠ 7 7')).to be_invalid }
      it { expect(build(:hand, card_b: '♠ 7 ♠')).to be_invalid }
      it { expect(build(:hand, card_c: '♠ 7 ♠ 4 2')).to be_invalid }
    end

    context 'when card has a number and suit in reverse order' do
      it { expect(build(:hand, card_a: 'A ♠')).to be_invalid }
      it { expect(build(:hand, card_b: '2 ♥')).to be_invalid }
      it { expect(build(:hand, card_c: 'J ♠')).to be_invalid }
    end

    context 'when card has only a number or only a suit' do
      it { expect(build(:hand, card_a: '♠')).to be_invalid }
      it { expect(build(:hand, card_b: '♥')).to be_invalid }
      it { expect(build(:hand, card_c: 'J')).to be_invalid }
    end

    context 'when sevens and fours have different suit than allowed' do
      it { expect(build(:hand, card_a: '♠ 7')).to be_invalid }
      it { expect(build(:hand, card_c: '♣ 7')).to be_invalid }
      it { expect(build(:hand, card_b: '♥ 4')).to be_invalid }
      it { expect(build(:hand, card_b: '♠ 4')).to be_invalid }
      it { expect(build(:hand, card_b: '♦ 4')).to be_invalid }
    end

    context 'when player has two or more identicals cards on his hand' do
      it { expect(build(:hand, card_a: '♠ 3', card_b: '♠ 3')).to be_invalid }
      it { expect(build(:hand, card_a: '♠ 2', card_c: '♠ 2')).to be_invalid }
      it { expect(build(:hand, card_b: '♣ 4', card_c: '♣ 4')).to be_invalid }
    end
  end
end
