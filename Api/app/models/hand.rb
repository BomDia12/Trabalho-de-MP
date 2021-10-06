class Hand < ApplicationRecord
  belongs_to :round
  validates :card_a, :card_b, :card_c, :player ,presence: true
  validates :player, inclusion:  0..3
end
