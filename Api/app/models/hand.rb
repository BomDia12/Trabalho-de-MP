class MyValidator < ActiveModel::Validator
  def validate(record)
    my_card_a = record.card_a.split() if record.card_a != nil 
    my_card_b = record.card_b.split() if record.card_b != nil
    my_card_c = record.card_c.split() if record.card_c != nil
    if record.card_a != nil 
      if not ['♠', '♥', '♣', '♦'].include? my_card_a[0]
        record.errors.add :card_a, "Need a suit in first word of string" 
      end
    end
  end
end

class Hand < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :round
  validates :card_a, :card_b, :card_c, :player ,presence: true
  validates :player, inclusion:  0..3
  validates_with MyValidator
end
