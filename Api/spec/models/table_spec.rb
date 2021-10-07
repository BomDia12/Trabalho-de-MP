# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Table, type: :model do
  describe 'factory' do
    it { expect(build(:table)).to be_valid }
  end

  describe 'validation' do
    context 'should allow nil cards' do
      it { expect(build(:table, card_a: nil, card_b: nil, card_c: nil, card_d: nil)).to be_valid }
      it { expect(build(:table, card_a: nil)).to be_valid }
      it { expect(build(:table, card_b: nil)).to be_valid }
      it { expect(build(:table, card_c: nil)).to be_valid }
      it { expect(build(:table, card_d: nil)).to be_valid }
    end

    context 'should be referencing a round' do
      it { expect(build(:table, round_id: nil)).to be_invalid }
    end

    context 'when card has no suit' do
      it { expect(build(:table, card_a: 'naipe 3')).to be_invalid }
      it { expect(build(:table, card_b: 'naipe 2')).to be_invalid }
      it { expect(build(:table, card_c: 'naipe 7')).to be_invalid }
      it { expect(build(:table, card_d: 'naipe 7')).to be_invalid }
    end

    context 'when card number is invalid' do
      it { expect(build(:table, card_a: '♠ 5')).to be_invalid }
      it { expect(build(:table, card_b: '♠ 6')).to be_invalid }
      it { expect(build(:table, card_c: '♠ 8')).to be_invalid }
      it { expect(build(:table, card_d: '♠ 9')).to be_invalid }
      it { expect(build(:table, card_a: '♠ 10')).to be_invalid }
    end

    context 'when card has more than a number and a suit' do
      it { expect(build(:table, card_a: '♠ 7 7')).to be_invalid }
      it { expect(build(:table, card_b: '♠ 7 ♠')).to be_invalid }
      it { expect(build(:table, card_c: '♠ 7 ♠ 4 2')).to be_invalid }
      it { expect(build(:table, card_d: '♠ 7 ♠ 4 2')).to be_invalid }
    end

    context 'when card has a number and suit in reverse order' do
      it { expect(build(:table, card_a: 'A ♠')).to be_invalid }
      it { expect(build(:table, card_b: '2 ♥')).to be_invalid }
      it { expect(build(:table, card_c: 'J ♠')).to be_invalid }
      it { expect(build(:table, card_d: 'K ♠')).to be_invalid }
    end

    context 'when card has only a number or only a suit' do
      it { expect(build(:table, card_a: '♠')).to be_invalid }
      it { expect(build(:table, card_b: '♥')).to be_invalid }
      it { expect(build(:table, card_c: 'J')).to be_invalid }
      it { expect(build(:table, card_d: '3')).to be_invalid }
    end

    context 'when sevens and fours have different suit than allowed' do
      it { expect(build(:table, card_a: '♠ 7')).to be_invalid }
      it { expect(build(:table, card_c: '♣ 7')).to be_invalid }
      it { expect(build(:table, card_b: '♥ 4')).to be_invalid }
      it { expect(build(:table, card_d: '♠ 4')).to be_invalid }
      it { expect(build(:table, card_b: '♦ 4')).to be_invalid }
    end

    context 'when has two or more identicals cards on the table' do
      it { expect(build(:table, card_a: '♠ 3', card_b: '♠ 3')).to be_invalid }
      it { expect(build(:table, card_a: '♠ 2', card_c: '♠ 2')).to be_invalid }
      it { expect(build(:table, card_b: '♣ 4', card_c: '♣ 4')).to be_invalid }
      it { expect(build(:table, card_b: '♣ 4', card_d: '♣ 4')).to be_invalid }
      it { expect(build(:table, card_a: '♠ A', card_d: '♠ A')).to be_invalid }
      it { expect(build(:table, card_c: '♥ 7', card_d: '♥ 7')).to be_invalid }
    end
  end
end
