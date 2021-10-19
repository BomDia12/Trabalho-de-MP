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
    before do
      @hand1 = create(:hand, round_id: roundbatata.id)
      @hand2 = create(:hand, round_id: roundbatata.id)
      @hand3 = create(:hand, round_id: roundbatata.id)
      @hand4 = create(:hand, round_id: roundbatata.id)
      roundbatata.reload
    end
    

    context "when the players have cards" do
      before { get "/games/round_begins/#{roundbatata.id}" }
      it { expect(roundbatata.id).to eq(@hand1.round_id) }
      it { expect(roundbatata.hands[0].id).to eq(@hand1.id) }
      it { expect(roundbatata.hands[1].id).to eq(@hand2.id) }
      it { expect(roundbatata.hands[2].id).to eq(@hand3.id) }
      it { expect(roundbatata.hands[3].id).to eq(@hand4.id) }
      it { expect(response).to have_http_status(:ok) }
    end
  end
end
