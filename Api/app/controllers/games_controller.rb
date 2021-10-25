class GamesController < ApplicationController
  # H12 & H13
  def create_game
    game = Game.new(point_a: 0, point_b: 0)
    game.save!
    if create_players(params[:users], game.id)
      return render json: { message: 'Please enter at most 4 users' }, status: :unprocessable_entity
    end

    create_round(game.id)
    render json: game, status: :created
  rescue StandardError => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  def show_game
    game = Game.find params[:id]
    render json: game
  rescue StandardError => e
    render json: { message: e.message }, status: :not_found
  end

  def show_round
    round = Round.find params[:id]
    render json: round
  rescue StandardError => e
    render json: { message: e.message }, status: :not_found
  end

  def show_hand
    hand = Hand.find params[:id]
    render json: hand
  rescue StandardError => e
    render json: { message: e.message }, status: :not_found
  end

  def show_table
    table = Table.find params[:id]
    render json: table
  rescue StandardError => e
    render json: { message: e.message }, status: :not_found
  end

  # H6
  def play
    hand = Hand.find(params[:hand_id])
    round = hand.round
    table = round.tables.last

    card = select_card_from_hand(params[:card], hand)
    insert_card_into_table(card, round.turn, table)

    if round.turn == 3
      return render json: round.game unless finish_table(round)
    else
      round.update!(turn: round.turn + 1)
    end

    render json: round, status: :ok
  rescue StandardError => e
    render json: { message: e.message }, status: :bad_request
  end

  def ask_truco
    round = Round.find(params[:round_id])
    player = params[:player]
    response = invalid_ask(round, player)

    return render json: response, status: :bad_request if response

    round.update!(awaiting_confirmation: true, multiplier_turn: player)
    render json: round, status: :ok
  rescue StandardError => e
    render json: { message: e.message }, status: :not_found
  end

  def truco_response
    round = Round.find(params[:round_id])
    response = invalid_response(round, params[:response])

    return render json: response, status: :bad_request if response

    check_response(round, params[:response])
    render json: Round.find(round.id)
  rescue StandardError => e
    render json: { message: e.message }, status: :not_found
  end

  def give_up
    game = Game.find params[:game_id]
    response = invalid_give_up(params[:player])

    return render json: response if response

    if params[:player].to_i.even?
      game.update!(point_b: 12)
    else
      game.update!(point_a: 12)
    end

    check_end_game game
    render json: game
  rescue StandardError => e
    render json: { message: e.message }, status: :not_found
  end

  private

  def create_players(users, game_id)
    return nil if users.nil?

    return 'Too many users' if users.size > 4

    (0...users.size).each do |i|
      UserGame.create(
        user_id: users[i],
        game_id: game_id,
        player: i
      )
    end
    nil
  end

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
    suits = %w[♠ ♥ ♣ ♦]
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

  # H6
  def select_card_from_hand(card_letter, hand)
    case card_letter
    when 'a'
      card = hand.card_a
      hand.update!(card_a: nil)
    when 'b'
      card = hand.card_b
      hand.update!(card_b: nil)
    when 'c'
      card = hand.card_c
      hand.update!(card_c: nil)
    else
      render json: { message: 'card has to be a, b or c' }, status: :unprocessable_entity
    end
    card
  end

  # H6
  def insert_card_into_table(card, turn, table)
    case turn
    when 0
      table.update!(card_a: card)
    when 1
      table.update!(card_b: card)
    when 2
      table.update!(card_c: card)
    else
      table.update!(card_d: card)
    end
  end

  # H6
  def finish_table(round)
    table = round.tables.last
    even_card = check_stronger_card(table.card_a, table.card_c)
    odd_card = check_stronger_card(table.card_b, table.card_d)
    winner = check_stronger_card(
      even_card == 1 ? table.card_a : table.card_c,
      odd_card == 1 ? table.card_b : table.card_d
    )
    check_round_winner(winner, round)
    round = Round.find(round.id)
    round.update!(turn: 0)
    if round.points_a == 2 || round.points_b == 2
      finish_round(round)
      false
    else
      create_table(round.id)
    end
  end

  def check_round_winner(winner, round)
    case winner
    when 1
      round.update!(points_a: round.points_a + 1)
    when 2
      round.update!(points_b: round.points_b + 1)
    else
      round.update!(points_a: round.points_a + 1,
                    points_b: round.points_b + 1)
    end
  end

  def check_stronger_card(card_1, card_2)
    manilhas = ['♣ 4', '♥ 7', '♠ A', '♦ 7']
    manilhas.each do |manilha|
      return 1 if card_1 == manilha
      return 2 if card_2 == manilha
    end
    order = %w[3 2 A K J Q]
    card_1 = card_1.split[1]
    card_2 = card_2.split[1]
    order.each do |symbol|
      return 3 if card_1 == symbol && card_2 == symbol
      return 1 if card_1 == symbol
      return 2 if card_2 == symbol
    end
  end

  def finish_round(round)
    game = round.game
    if round.points_a == 2
      game.update!(point_a: game.point_a + round.multiplier)
    else
      game.update!(point_b: game.point_b + round.multiplier)
    end
    round.update!(ended: true)
    create_round(game.id)
    game = Game.find(game.id)
    check_end_game(game)
  end

  def check_end_game(game)
    if game.point_a >= 12
      win_game(game, true)
    elsif game.point_b >= 12
      win_game(game, false)
    else
      false
    end
  end

  def win_game(game, even_winner)
    game.user_games.each do |user_game|
      if (even_winner && user_game.player.even?) || (!even_winner && user_game.player.odd?)
        user_game.update!(winner: true)
      else
        user_game.update!(winner: false)
      end
    end
  end

  def invalid_ask(round, player)
    return { message: 'O jogador tem que estar entre 0 e 3' } unless (0..3).include? player.to_i

    if round.multiplier_turn && (round.multiplier_turn.even? == player.to_i.even?)
      return { message: 'Você ou o seu parceiro pediram truco pela última vez' }
    end

    false
  end

  def invalid_response(round, response)
    valid_responses = %w[y n r]
    return { message: 'A resposta tem que ser y, n ou r!' } unless valid_responses.include? response

    return { message: 'Ninguem pediu truco ainda nesse round!' } unless round.awaiting_confirmation

    false
  end

  def check_response(round, response)
    multiplier = next_multiplier(round.multiplier)
    case response
    when 'y'
      round.update!(multiplier: multiplier,
                    awaiting_confirmation: false)
    when 'n'
      if round.multiplier_turn.even?
        round.update!(awaiting_confirmation: false, points_a: 2)
      else
        round.update!(awaiting_confirmation: false, points_b: 2)
      end
      finish_round(round)
    when 'r'
      if round.multiplier_turn.even?
        round.update!(multiplier: multiplier,
                      awaiting_confirmation: true,
                      multiplier_turn: 1)
      else
        round.update!(multiplier: multiplier,
                      awaiting_confirmation: true,
                      multiplier_turn: 0)
      end
    end
  end

  def next_multiplier(multiplier)
    table = { 1 => 3, 3 => 6, 6 => 9, 9 => 12 }
    table[multiplier]
  end

  def invalid_give_up(player)
    return { message: 'O jogador tem que estar entre 0 e 3!' } unless (0..3).include? player.to_i

    false
  end
end
