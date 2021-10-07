require 'rails_helper'

RSpec.describe Table, type: :model do
  describe 'factory' do
    it { expect(build(:table)).to be_valid }
  end

  describe 'validation' do
    context 'should allow nil cards' do
      it { expect(build(:table, card_a: nil, card_b: nil, card_c: nil, card_d: nil)).to be_valid }
    end
  end
end
