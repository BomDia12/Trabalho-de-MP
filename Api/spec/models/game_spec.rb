require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'factory' do
    it { expect(build(:game)).to be_valid }
  end

  describe 'validations' do
    context 'when has an empty field' do
      it { expect(build(:game, point_a: nil)).to be_invalid }
    end
  end
end
