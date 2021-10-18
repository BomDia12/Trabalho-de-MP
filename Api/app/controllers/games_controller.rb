class GamesController < ApplicationController

    def create_game
        game = Game.new(point_a: 0, point_b: 0)
        game.save!
        render json: game, status: :created
    rescue StandardError => e
        render json: { message: e.message }, status: :unprocessable_entity
    end

    private
    def construct_deck
        suits, normal_cards = ['♠', '♥', '♣', '♦'], ['Q', 'J', 'K', 'A', '2', '3']
        my_deck = ['♣ 4', '♦ 7', '♥ 7']
        suits.each do |suit|
            normal_cards.each do |card|
                my_deck.push("#{suit} #{card}")
            end
        end
        return my_deck
    end

    def distribute_cards
        deck, hands = construct_deck.sample(28, random: Random.new(1)), [[],[],[],[]]
        for i in 0...4
            for j in 0...4
                card = deck.sample
                hands[i].push(card)
                deck.delete(card)
            end
        end
        return hands
    end
end
