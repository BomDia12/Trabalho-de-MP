require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  describe 'factory' do
    context 'when using standard user factory' do
      it { expect(user).to be_valid }

      it { expect(user.authentication_token).not_to be_nil }
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
      it { expect(build(:user, email: user.email)).to be_invalid }
    end
  end
end
