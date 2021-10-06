require 'rails_helper'

RSpec.describe UserGame, type: :model do
  describe 'factory' do
    context 'should create UserGame' do
      it { expect(build(:user_game)).to be_valid }
    end
  end

  describe 'Anonymous User' do
    context 'should allow for no user' do
      it { expect(build(:user_game, user_id: nil)) }
    end
  end
end
