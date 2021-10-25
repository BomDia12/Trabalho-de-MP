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
          expect(response.body).to eql '{"message":"Please enter at most 4 users"}'
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

        it 'should change round status to ended' do
          expect(Round.find(round.id).ended).to eql true
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

    context 'test end of game' do
      let(:even_user) { create(:user) }
      let(:odd_user) { create(:user, email: 'odd@mail') }
      let(:game) { create(:game, point_a: 11, point_b: 11) }
      let(:round) { create(:round, game_id: game.id, points_b: 1, points_a: 1, turn: 3) }
      let(:hand) { create(:hand, card_a: '♣ 4', card_b: '♥ J', round_id: round.id) }
      before do
        create(:user_game, user_id: even_user.id, game_id: game.id, player: 0)
        create(:user_game, user_id: odd_user.id, game_id: game.id, player: 1)
        create(:table,
               round_id: round.id,
               card_a: '♥ 3',
               card_b: '♥ 2',
               card_c: '♠ Q',
               card_d: nil)
      end

      context 'even win' do
        before do
          post '/games/play', params: {
            hand_id: hand.id,
            card: 'b'
          }
        end

        it 'should add points to even' do
          expect(Game.find(game.id).point_a).to eql 12
        end

        it 'should return ok' do
          expect(response).to have_http_status :ok
        end

        it 'should update winner for winner' do
          expect(even_user.user_games.last.winner).to eql true
        end

        it 'should update winner for loser' do
          expect(odd_user.user_games.last.winner).to eql false
        end
      end

      context 'odd win' do
        before do
          post '/games/play', params: {
            hand_id: hand.id,
            card: 'a'
          }
        end

        it 'should return ok' do
          expect(response).to have_http_status :ok
        end

        it 'should update winner for winner' do
          expect(odd_user.user_games.last.winner).to eql true
        end

        it 'should update winner for loser' do
          expect(even_user.user_games.last.winner).to eql false
        end
      end
    end
  end

  describe 'GET show game' do
    let(:game) { create(:game) }
    context 'has valid params' do
      before do
        get "/games/#{game.id}"
      end

      it 'should be successful' do
        expect(response).to have_http_status :ok
      end

      it 'should return json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'has invalid params' do
      before do
        get "/games/#{game.id + 1}"
      end

      it 'should return error' do
        expect(response).to have_http_status :not_found
      end
    end
  end

  describe 'GET show round' do
    let(:round) { create(:round) }
    context 'has valid params' do
      before do
        get "/games/round/#{round.id}"
      end

      it 'should be successful' do
        expect(response).to have_http_status :ok
      end

      it 'should return json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'has invalid params' do
      before do
        get "/games/round/#{round.id + 1}"
      end

      it 'should return error' do
        expect(response).to have_http_status :not_found
      end
    end
  end

  describe 'GET show hand' do
    let(:hand) { create(:hand) }
    context 'has valid params' do
      before do
        get "/games/hand/#{hand.id}"
      end

      it 'should be successful' do
        expect(response).to have_http_status :ok
      end

      it 'should return json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'has invalid params' do
      before do
        get "/games/hand/#{hand.id + 1}"
      end

      it 'should return error' do
        expect(response).to have_http_status :not_found
      end
    end
  end

  describe 'GET show table' do
    let(:table) { create(:table) }
    context 'has valid params' do
      before do
        get "/games/table/#{table.id}"
      end

      it 'should be successful' do
        expect(response).to have_http_status :ok
      end

      it 'should return json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'has invalid params' do
      before do
        get "/games/table/#{table.id + 1}"
      end

      it 'should return error' do
        expect(response).to have_http_status :not_found
      end
    end
  end

  describe 'POST ask truco' do
    let(:round) { create(:round) }
    context 'valid params' do
      before do
        post '/games/truco/ask', params: {
          player: 0,
          round_id: round.id
        }
      end

      it 'should return ok' do
        expect(response).to have_http_status :ok
      end

      it 'should update round' do
        updated = Round.find round.id
        expect(updated.awaiting_confirmation).to eql true
        expect(updated.multiplier_turn).to eql 0
      end
    end

    context 'other players ask for truco' do
      it 'player 1' do
        post '/games/truco/ask', params: {
          player: 1,
          round_id: round.id
        }
        updated = Round.find round.id
        expect(updated.awaiting_confirmation).to eql true
        expect(updated.multiplier_turn).to eql 1
      end

      it 'player 2' do
        post '/games/truco/ask', params: {
          player: 2,
          round_id: round.id
        }
        updated = Round.find round.id
        expect(updated.awaiting_confirmation).to eql true
        expect(updated.multiplier_turn).to eql 2
      end

      it 'player 3' do
        post '/games/truco/ask', params: {
          player: 3,
          round_id: round.id
        }
        updated = Round.find round.id
        expect(updated.awaiting_confirmation).to eql true
        expect(updated.multiplier_turn).to eql 3
      end
    end

    context 'invalid params' do
      it 'round does not exist' do
        post '/games/truco/ask', params: {
          player: 3,
          round_id: round.id + 1
        }
        expect(response).to have_http_status :not_found
      end

      it 'player is not in 0..3' do
        post '/games/truco/ask', params: {
          player: 4,
          round_id: round.id
        }
        expect(response).to have_http_status :bad_request
        expect(response.body).to eql '{"message":"O jogador tem que estar entre 0 e 3"}'
      end

      it 'player has asked for the last multiplier' do
        round = create(:round, multiplier_turn: 0)
        post '/games/truco/ask', params: {
          player: 0,
          round_id: round.id
        }
        message = { message: 'Você ou o seu parceiro pediram truco pela última vez' }
        expect(response.body).to eql message.to_json
        expect(response).to have_http_status :bad_request
      end

      it "player's partner has asked for the last multiplier" do
        post '/games/truco/ask', params: {
          player: 1,
          round_id: create(:round, multiplier_turn: 3).id
        }
        message = { message: 'Você ou o seu parceiro pediram truco pela última vez' }
        expect(response).to have_http_status :bad_request
        expect(response.body).to eql message.to_json
      end
    end
  end

  describe 'POST truco response' do
    let(:round) { create(:round, awaiting_confirmation: true, multiplier_turn: 0) }
    context 'valid params' do
      context 'Yes response' do
        before do
          post '/games/truco/response', params: {
            response: 'y',
            round_id: round.id
          }
        end

        it 'should return ok' do
          expect(response).to have_http_status :ok
        end

        it 'should update round' do
          expect(Round.find(round.id).multiplier).to eql 3
          expect(Round.find(round.id).awaiting_confirmation).to eql false
        end
      end

      context 'negative response' do
        before do
          post '/games/truco/response', params: {
            response: 'n',
            round_id: round.id
          }
        end

        it 'should return ok response' do
          expect(response).to have_http_status :ok
        end

        it 'should update round' do
          expect(Round.find(round.id).ended).to eql true
          expect(Round.find(round.id).awaiting_confirmation).to eql false
          expect(Round.find(round.id).points_a).to eql 2
        end

        it 'should update game' do
          expect(Game.find(round.game_id).point_a).to eql 2
        end
      end

      context 'raise response' do
        before do
          post '/games/truco/response', params: {
            response: 'r',
            round_id: round.id
          }
        end

        it 'should return ok' do
          expect(response).to have_http_status :ok
        end

        it 'should update round' do
          expect(Round.find(round.id).multiplier).to eql 3
          expect(Round.find(round.id).awaiting_confirmation).to eql true
          expect(Round.find(round.id).multiplier_turn).to eql 1
        end
      end
    end

    context "check when multiplier isn't 1" do
      it 'when multiplier is 3' do
        round = create(:round, awaiting_confirmation: true, multiplier_turn: 0, multiplier: 3)
        post '/games/truco/response', params: {
          response: 'y',
          round_id: round.id
        }
        expect(Round.find(round.id).multiplier).to eql 6
      end

      it 'when multiplier is 6' do
        round = create(:round, awaiting_confirmation: true, multiplier_turn: 0, multiplier: 6)
        post '/games/truco/response', params: {
          response: 'y',
          round_id: round.id
        }
        expect(Round.find(round.id).multiplier).to eql 9
      end

      it 'when multiplier is 9' do
        round = create(:round, awaiting_confirmation: true, multiplier_turn: 0, multiplier: 9)
        post '/games/truco/response', params: {
          response: 'y',
          round_id: round.id
        }
        expect(Round.find(round.id).multiplier).to eql 12
      end
    end

    context 'invalid params' do
      it 'when is not awaiting confirmation' do
        round = create(:round, awaiting_confirmation: false, multiplier_turn: 0, multiplier: 9)
        post '/games/truco/response', params: {
          response: 'y',
          round_id: round.id
        }
        message = { message: 'Ninguem pediu truco ainda nesse round!' }
        expect(response).to have_http_status :bad_request
        expect(response.body).to eql message.to_json
      end

      it 'when there is no round' do
        post '/games/truco/response', params: {
          response: 'y',
          round_id: round.id + 1
        }
        expect(response).to have_http_status :not_found
      end

      it 'when response is not y, n or r' do
        round = create(:round, awaiting_confirmation: false, multiplier_turn: 0, multiplier: 9)
        post '/games/truco/response', params: {
          response: 'e',
          round_id: round.id
        }
        message = { message: 'A resposta tem que ser y, n ou r!' }
        expect(response).to have_http_status :bad_request
        expect(response.body).to eql message.to_json
      end
    end
  end

  describe 'POST give up' do
    let(:game) { create(:game) }
    context 'valid params' do
      context 'player is even' do
        before do
          post '/games/give_up', params: {
            player: 0,
            game_id: game.id
          }
        end

        it 'should return ok' do
          expect(response).to have_http_status :ok
        end

        it 'should update game' do
          expect(Game.find(game.id).point_b).to eql 12
        end
      end

      context 'player is odd' do
        before do
          post '/games/give_up', params: {
            player: 1,
            game_id: game.id
          }
        end

        it 'should return ok' do
          expect(response).to have_http_status :ok
        end

        it 'should update game' do
          expect(Game.find(game.id).point_a).to eql 12
        end
      end
    end

    context 'invalid params' do
      it "player isn't in 0..3" do
        post '/games/give_up', params: {
          player: 5,
          game_id: game.id
        }
        message = { message: 'O jogador tem que estar entre 0 e 3!' }
        expect(response.body).to eql message.to_json
      end

      it "game doesn't exist" do
        post '/games/give_up', params: {
          player: 0,
          game_id: game.id + 1
        }
        expect(response).to have_http_status :not_found
      end
    end
  end
end
