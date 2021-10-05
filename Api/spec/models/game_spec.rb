require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'factory' do
    it { expect(build(:game)).to be_valid }
  end
end
