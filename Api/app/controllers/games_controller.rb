class GamesController < ApplicationController

    private
    def contruct_deck
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
        deck, hands = construct_deck.sample, Array.new
        for i in 0..4
            for j in 0..4
                hands[i].push(deck.pop)
        end
        return hands
    end
end
