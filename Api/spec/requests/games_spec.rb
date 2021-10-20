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

    context 'adds uses to game' do
      let(:game) { Game.last }
      let(:user1) { create(:user, email: '1@mail') }
      let(:user2) { create(:user, email: '2@mail') }
      let(:user3) { create(:user, email: '3@mail') }
      let(:user4) { create(:user, email: '4@mail') }
      let(:user5) { create(:user, email: '5@mail') }
      it '1 user' do
        post '/games/new', params: {
          users: [
            user1.id
          ]
        }
        expect(user1.games.last.id).to eql game.id
      end

      it '2 user' do
        post '/games/new', params: {
          users: [
            user1.id,
            user2.id
          ]
        }
        expect(user1.games.last.id).to eql game.id
        expect(user2.games.last.id).to eql game.id
      end

      it '3 user' do
        post '/games/new', params: {
          users: [
            user1.id,
            user2.id,
            user3.id
          ]
        }
        expect(user1.games.last.id).to eql game.id
        expect(user2.games.last.id).to eql game.id
        expect(user3.games.last.id).to eql game.id
      end

      it '4 user' do
        post '/games/new', params: {
          users: [
            user1.id,
            user2.id,
            user3.id,
            user4.id
          ]
        }
        expect(user1.games.last.id).to eql game.id
        expect(user2.games.last.id).to eql game.id
        expect(user3.games.last.id).to eql game.id
        expect(user4.games.last.id).to eql game.id
      end

      context 'invalid number of users' do
        before do
          post '/games/new', params: {
            users: [
              user1.id,
              user2.id,
              user3.id,
              user4.id,
              user5.id
            ]
          }
        end

        it 'returns error' do
          expect(response).to have_http_status :unprocessable_entity
        end

        it 'returns error message' do
          expect(response.body).to eql 'Please enter at most 4 users'
        end

        it 'should create game_users' do
          expect(user1.user_games.size).to eql 0
          expect(user2.user_games.size).to eql 0
          expect(user3.user_games.size).to eql 0
          expect(user4.user_games.size).to eql 0
          expect(user5.user_games.size).to eql 0
        end
      end
    end
  end

  describe 'POST play' do
    context 'sending card a on turn 0' do
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

      it 'should advance to the next turn' do
        expect(Round.find(round.id).turn).to eq 1
      end
    end

    context 'sending card b and turn 1' do
      let(:game) { create(:game) }
      let(:round) { create(:round, game_id: game.id, turn: 1) }
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
          card: 'b'
        }
      end

      it 'should return ok code' do
        expect(response).to have_http_status :ok
      end

      it 'responds with a json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'removes card from hand' do
        expect(Hand.find(hand.id).card_b).to be_nil
      end

      it 'places right card on table' do
        expect(round.tables.last.card_b).to eql '♥ 2'
      end

      it 'should advance to the next turn' do
        expect(Round.find(round.id).turn).to eq 2
      end
    end

    context 'sending card c and turn 2' do
      let(:game) { create(:game) }
      let(:round) { create(:round, game_id: game.id, turn: 2) }
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
          card: 'c'
        }
      end

      it 'should return ok code' do
        expect(response).to have_http_status :ok
      end

      it 'responds with a json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'removes card from hand' do
        expect(Hand.find(hand.id).card_c).to be_nil
      end

      it 'places right card on table' do
        expect(round.tables.last.card_c).to eql '♦ 2'
      end

      it 'should advance to the next turn' do
        expect(Round.find(round.id).turn).to eq 3
      end
    end

    context 'sending card c and turn 3' do
      let(:game) { create(:game) }
      let(:round) { create(:round, game_id: game.id, turn: 3) }
      let(:hand) { create(:hand, round_id: round.id) }
      before do
        create(:table,
               round_id: round.id,
               card_a: '♣ 4',
               card_b: '♠ 3',
               card_c: '♥ 2',
               card_d: nil)
        post '/games/play', params: {
          hand_id: hand.id,
          card: 'c'
        }
      end

      it 'should return ok code' do
        expect(response).to have_http_status :ok
      end

      it 'responds with a json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'removes card from hand' do
        expect(Hand.find(hand.id).card_c).to be_nil
      end

      it 'places right card on table' do
        expect(round.tables.first.card_d).to eql '♦ 2'
      end

      it 'should advance to the next turn' do
        expect(Round.find(round.id).turn).to eq 0
      end

      it 'should create a new table and new hands' do
        expect(round.hands.size).to eql 5
        expect(round.tables.size).to eql 2
      end

      it '0 and 2 should win' do
        expect(Round.find(round.id).points_a).to eql 1
        expect(Round.find(round.id).points_b).to eql 0
      end
    end

    context 'test win conditions' do
      let(:game) { create(:game) }
      let(:round) { create(:round, game_id: game.id, turn: 3) }
      let(:hand) { create(:hand, round_id: round.id) }

      it 'players should tie' do
        create(:table,
               round_id: round.id,
               card_a: '♥ 3',
               card_b: '♠ 3',
               card_c: '♥ 2',
               card_d: nil)
        post '/games/play', params: {
          hand_id: hand.id,
          card: 'c'
        }
        expect(Round.find(round.id).points_a).to eql 1
        expect(Round.find(round.id).points_b).to eql 1
      end

      it '1 and 3 should win' do
        create(:table,
               round_id: round.id,
               card_a: '♥ A',
               card_b: '♥ 2',
               card_c: '♠ Q',
               card_d: nil)
        post '/games/play', params: {
          hand_id: hand.id,
          card: 'c'
        }
        expect(Round.find(round.id).points_a).to eql 0
        expect(Round.find(round.id).points_b).to eql 1
      end
    end

    context 'test end of round' do
      let(:game) { create(:game) }
      let(:round) do
        create(:round,
               game_id: game.id,
               turn: 3,
               points_a: 1,
               points_b: 1)
      end
      let(:hand) { create(:hand, round_id: round.id) }

      context 'odd players win' do
        before do
          create(:table,
                 round_id: round.id,
                 card_a: '♥ A',
                 card_b: '♥ 2',
                 card_c: '♠ Q',
                 card_d: nil)
          post '/games/play', params: {
            hand_id: hand.id,
            card: 'c'
          }
        end

        it 'expect to have success status' do
          expect(response).to have_http_status :ok
        end

        it 'should create new round' do
          expect(game.rounds.last.id).to_not eql round.id
        end

        it 'should update points' do
          expect(Game.find(game.id).point_a).to eql 1
          expect(Game.find(game.id).point_b).to eql 2
        end
      end

      context 'even players win' do
        before do
          create(:table,
                 round_id: round.id,
                 card_a: '♣ 4',
                 card_b: '♠ 3',
                 card_c: '♥ 2',
                 card_d: nil)
          post '/games/play', params: {
            hand_id: hand.id,
            card: 'c'
          }
        end

        it 'expect to have success status' do
          expect(response).to have_http_status :ok
        end

        it 'should create new round' do
          expect(game.rounds.last.id).to_not eql round.id
        end

        it 'should update points' do
          expect(Game.find(game.id).point_a).to eql 2
          expect(Game.find(game.id).point_b).to eql 1
        end
      end
    end
  end
end
