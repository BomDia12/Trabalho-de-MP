require 'rails_helper'

RSpec.describe 'Games', type: :request do
  describe 'POST create game' do
    context 'with valid params' do
      let(:game) { Game.last }
      before do
        post '/games/new'
      end
      it 'return a success response' do
        expect(response).to have_http_status(:created)
      end

      it 'responds with a json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'creates a round' do
        expect(game.rounds.first).to_not be_nil
      end

      it 'creates the hands' do
        expect(game.rounds.first.hands.size).to eql 4
      end

      it 'creates the table' do
        expect(game.rounds.first.tables.first).to_not be_nil
      end
    end
  end

  describe 'POST play' do
    context 'standard params' do
      let(:game) { create(:game) }
      let(:round) { create(:round, game_id: game.id, turn: 0) }
      let(:hand) { create(:hand, round_id: round.id) }
      before do
        create(:table,
               round_id: round.id,
               card_a: nil,
               card_b: nil,
               card_c: nil,
               card_d: nil)
        post '/games/play', params: {
          hand_id: hand.id,
          card: 'a'
        }
      end

      it 'should return ok code' do
        expect(response).to have_http_status :ok
      end

      it 'responds with a json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'removes card from hand' do
        expect(Hand.find(hand.id).card_a).to be_nil
      end

      it 'places right card on table' do
        expect(round.tables.last.card_a).to eql '♠ 3'
      end
    end
  end
end
