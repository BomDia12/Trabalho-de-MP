class GamesController < ApplicationController
  # def teste
  #   batata = Round.find(params[:id])
  #    render json: batata.hands
  # end

  def create_game
    game = Game.new(point_a: 0, point_b: 0)
    game.save!
    round = create_round(game.id)
    render json: game, status: :created
  rescue StandardError => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  def construct_hands
    round = Round.find(params[:id])
    hands = distribute_cards
    (0...4).each do |i|
      round.hands[i].card_a = hands[i][0]
      round.hands[i].card_b = hands[i][1]
      round.hands[i].card_c = hands[i][2]
      round.hands[i].save!
    end
    render json: round.hands, status: :ok
  rescue StandardError => e
    render json: { message: e.message }, status: :bad_request
  end

  private

  def create_round(game_id)
    Round.create({
                   game_id: game_id,
                   points_a: 0,
                   points_b: 0,
                   multiplier: 1,
                   multiplier_turn: nil,
                   turn: 0,
                   ended: false
                 })
  end

  def create_hands
    head 500
  end

  def create_table
    head 500
  end

  def construct_deck
    suits = ['♠', '♥', '♣', '♦']
    normal_cards = %w[Q J K A 2 3]
    my_deck = ['♣ 4', '♦ 7', '♥ 7']
    suits.each do |suit|
      normal_cards.each do |card|
        my_deck.push("#{suit} #{card}")
      end
    end
    my_deck
  end

  def distribute_cards
    deck = construct_deck.sample(28, random: Random.new(1))
    hands = [[], [], [], []]
    (0...4).each do |i|
      (0...3).each do |_j|
        card = deck.sample
        hands[i].push(card)
        deck.delete(card)
      end
    end
    hands
  end
end
