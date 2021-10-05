require 'rails_helper'

RSpec.describe Round, type: :model do
  describe "factory" do
    it { expect(build(:round)).to be_valid }
  end

  describe "validations" do
    context "when has an empty field" do
      it { expect(build(:round, game_id: nil)).to be_invalid }
      it { expect(build(:round, points_a: nil)).to be_invalid }
    end
  end
end
