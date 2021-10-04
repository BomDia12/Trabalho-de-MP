require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }

  describe 'factory' do
    context 'when using standard user factory' do
      it { expect(user).to be_valid }
    end
  end

  describe 'validations' do
    context 'user has no name' do
      it { expect(build(:user, name: nil)).to be_invalid }
    end

    context 'user has too short of a name' do
      it { expect(build(:user, name: '')).to be_invalid }
    end

    context 'user has no email' do
      it { expect(build(:user, email: nil)).to be_invalid }
    end

    context 'user has a repeated email' do
      before { create(:user, email: user.email) }

      it { expect(build(:user, email: user.email)).to be_invalid }
    end
  end
end