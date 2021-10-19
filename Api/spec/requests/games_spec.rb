require 'rails_helper'

RSpec.describe 'Games', type: :request do
  describe 'POST create' do
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
end
