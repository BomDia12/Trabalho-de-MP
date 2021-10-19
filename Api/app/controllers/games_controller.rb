class GamesController < ApplicationController
  # def teste
  #   batata = Round.find(params[:id])
  #    render json: batata.hands
  # end

  # H12 & H13
  def create_game
    game = Game.new(point_a: 0, point_b: 0)
    game.save!
    round = create_round(game.id)
    render json: game, status: :created
  rescue StandardError => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  # H6
  def play
    head 500
  end

  private

  # H12 & H13
  def create_round(game_id)
    round = Round.create({
                           game_id: game_id,
                           points_a: 0,
                           points_b: 0,
                           multiplier: 1,
                           multiplier_turn: nil,
                           turn: 0,
                           ended: false
                         })
    create_hands(round.id) # H5
    create_table(round.id)
  end

  # H12 & H13
  def create_hands(round_id)
    hands = distribute_cards
    (0..3).each do |i|
      Hand.create({
                    round_id: round_id,
                    player: i,
                    card_a: hands[i][0],
                    card_b: hands[i][1],
                    card_c: hands[i][2]
                  })
    end
  end

  # H12 & H13
  def create_table(round_id)
    Table.create({ round_id: round_id })
  end

  # H5
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

  # H5
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
