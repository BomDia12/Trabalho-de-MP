class ValidateCard < ActiveModel::Validator
  def validate(record)
    my_card_a = record.card_a.split() if record.card_a != nil 
    my_card_b = record.card_b.split() if record.card_b != nil
    my_card_c = record.card_c.split() if record.card_c != nil
    my_cards, count = [my_card_a, my_card_b, my_card_c], 0
    for x in ['a', 'b', 'c'] do
      if my_cards[count] != nil 
        if not my_cards[count].length != 2
          if not ['♠', '♥', '♣', '♦'].include? my_cards[count][0]
            record.errors.add "card_#{x}".to_sym,"need a suit in first word of string"
          end
          if not ['Q', 'J', 'K', 'A', '2', '3', '4', '7'].include? my_cards[count][1]
            record.errors.add "card_#{x}".to_sym, "need a valid number in the second word of string"
          end
          if my_cards[count][1] == '7' and ['♠', '♣'].include? my_cards[count][0]
            record.errors.add "card_#{x}".to_sym, "seven can only be ♥ or ♦"
          end
          if my_cards[count][1] == '4' and ['♠', '♥', '♦'].include? my_cards[count][0]
            record.errors.add "card_#{x}".to_sym, "four can only be ♣"
          end
        else
          record.errors.add "card_#{x}".to_sym, "card can only have a suit and a number"
        end
      end
      count += 1
    end
  end
end

class ValidateHand < ActiveModel::Validator
  def validate(record)
    if record.card_a == record.card_b
      record.errors.add :card_b, "card_b can not be identical to card_a"
    elsif record.card_b == record.card_c
      record.errors.add :card_c, "card_c can not be identical to card_b"
    elsif record.card_a == record.card_c
      record.errors.add :card_c, "card_c can not be identical to card_a"
    end
  end
end

class Hand < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :round
  validates :player ,presence: true
  validates :player, inclusion:  0..3
  validates_with ValidateCard
  validates_with ValidateHand
end
