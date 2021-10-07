require 'rails_helper'

RSpec.describe Table, type: :model do
  describe 'factory' do
    it { expect(build(:table)).to be_valid }
  end
end
