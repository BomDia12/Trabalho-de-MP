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
    let(:round) { create :round }
    let(:hand1) { create :hand, round: round }
    let(:hand2) { create :hand, round: round }
    let(:hand3) { create :hand, round: round }
    let(:hand4) { create :hand, round: round }

    context "when the players have cards" do
      before { get "/games/round_begins/#{round.id}" }
      it { expect(round.hands).not_to be_nil }
      it { expect(round.hands.size).to eq(4) }
      it { expect(response).to have_http_status(:ok) }

      
    end
  end
end
