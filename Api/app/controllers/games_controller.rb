class GamesController < ApplicationController

    def index
        batata = distribute_cards
        render json: batata
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
                hands[i].push(deck.pop)
            end
        end
        return hands
    end
end
