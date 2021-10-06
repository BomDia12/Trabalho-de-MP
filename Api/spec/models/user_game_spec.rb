require 'rails_helper'

RSpec.describe UserGame, type: :model do
  describe 'factory' do
    context 'should create UserGame' do
      it { expect(build(:user_game)).to be_valid }
    end
  end

  describe 'Anonymous User' do
    context 'should allow for no user' do
      it { expect(build(:user_game, user_id: nil)).to be_valid }
    end
  end

  describe 'validations' do
    context "shouldn't allow numbers outside 0..3" do
      it { expect(build(:user_game, player: -1)).to be_invalid }

      it { expect(build(:user_game, player: 4)).to be_invalid }
    end
  end
end
