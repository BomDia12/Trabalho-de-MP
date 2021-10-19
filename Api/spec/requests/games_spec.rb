require 'rails_helper'

RSpec.describe "Games", type: :request do
  describe "POST create" do
    context "with valid params" do
      before do
        post '/games/new'
      end
      it 'return a success response' do
        expect(response).to have_http_status(:created)
      end
      it 'responds with a json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "GET construct_hands" do
    let(:roundbatata) { create :round }
    let(:hand1) { create :hand, round_id: roundbatata.id }
    let(:hand2) { create :hand, round_id: roundbatata.id }
    let(:hand3) { create :hand, round_id: roundbatata.id }
    let(:hand4) { create :hand, round_id: roundbatata.id }

    context "when the players have cards" do
      before { get "/games/round_begins/#{roundbatata.id}" }
      it { expect(hand1.round_id).to eq(roundbatata.id) }
      it { expect(hand2.round_id).to eq(roundbatata.id) }
      it { expect(hand3.round_id).to eq(roundbatata.id) }
      it { expect(hand4.round_id).to eq(roundbatata.id) }
      it { expect(roundbatata.id).to eq(hand1.round_id) }
      it { expect(roundbatata.hands[0].id).to eq(hand1.id) }

      it { expect(response).to have_http_status(:ok) }

      
    end
  end
end
