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
      it { expect(build(:table, card_a: "naipe 3")).to be_invalid }
      it { expect(build(:table, card_b: "naipe 2")).to be_invalid }
      it { expect(build(:table, card_c: "naipe 7")).to be_invalid }
      it { expect(build(:table, card_d: "naipe 7")).to be_invalid }
    end
  end
end
