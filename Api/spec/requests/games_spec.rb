require 'rails_helper'

RSpec.describe 'Games', type: :request do
  describe 'POST create' do
    context 'with valid params' do
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

  describe 'GET construct_hands' do
    let(:round) { create :round }
    before do
      @hand1 = create(:hand, round_id: round.id)
      @hand2 = create(:hand, round_id: round.id)
      @hand3 = create(:hand, round_id: round.id)
      @hand4 = create(:hand, round_id: round.id)
      round.reload
    end

    context 'when players hand belongs to an round' do
      before { get "/games/round_begins/#{round.id}" }
      it { expect(round.id).to eq(@hand1.round_id) }
      it { expect(round.hands[0].id).to eq(@hand1.id) }
      it { expect(round.hands[1].id).to eq(@hand2.id) }
      it { expect(round.hands[2].id).to eq(@hand3.id) }
      it { expect(round.hands[3].id).to eq(@hand4.id) }
      it 'should return an ok status ' do
        expect(response).to have_http_status(:ok)
      end
      it 'should response with an json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'when there is less than 4 players in an round' do
      before do
        @hand4.destroy!
        round.reload
      end
      before { get "/games/round_begins/#{round.id}" }
      it 'should return an bad_request status' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
